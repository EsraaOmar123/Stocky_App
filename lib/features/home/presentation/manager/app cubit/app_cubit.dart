import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/features/home/presentation/views/cart.dart';
import 'package:project1/features/home/presentation/views/fav_screen.dart';
import 'package:project1/features/home/presentation/views/home.dart';
import 'package:project1/features/profile/presentation/views/account_view.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/utils/assets.dart';
import '../../../data/models/product_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeNav(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> screen = const [
    HomeScreen(),
    CartScreen(),
    FavScreen(),
    AccountView()
  ];

  List<ProductModel> data = [];

  List<ProductModel> searchItems(String searchTerm) {
    return data
        .where((item) =>
            item.title?.toLowerCase().contains(searchTerm.toLowerCase()) ??
            false)
        .toList();
  }

  late Database database;

  void createDataBase() async {
    database = await openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE cart(id INTEGER PRIMARY KEY ,image TEXT , title TEXT ,description TEXT ,price double , sizes TEXT )')
            .then((value) {
          db.execute(
              'CREATE TABLE fav(id INTEGER PRIMARY KEY ,image TEXT , title TEXT ,description TEXT ,price double , sizes TEXT )');
          db
              .execute(
                  'CREATE TABLE data(id INTEGER PRIMARY KEY ,image TEXT , title TEXT ,description TEXT ,price double , sizes TEXT )')
              .then((value) {
            getData();
          });

          debugPrint('tabl');
        }).catchError((error) {
          debugPrint(error.toString());
        });
      },
      onOpen: (db) {
        getDataFromDatabase(db);

        emit(OpenDataBaseSuccessState());
//        getDataFromDatabase(db);
      },
    );
  }

  List<ProductModel> searchModels = [];
  void search({required String key}) {
    searchModels = [];
    emit(LoadingDataState());
    database
        .rawQuery("SELECT * FROM data WHERE LOWER(title) LIKE '%$key%'")
        .then((value) {
      for (var element in value) {
        searchModels.add(ProductModel.fromJson(element));
      }
      debugPrint(searchModels[0].image);
      emit(SearchSuccess());
    }).catchError((error) {
      emit(SearchError());
    });
  }

  void insertIntoDataBase({
    required String image,
    required String title,
    required String price,
    required String sizes,
    required String description,
    required String table,
  }) async {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO $table(image  , title  ,description  ,price  , sizes   ) VALUES("$image", "$title", "$description" , "$price" , "$sizes" )');
    }).then((value) {
      emit(InsertIntoDataBaseSuccessState());
      getDataFromDatabase(database);
    }).catchError((error) {
      emit(InsertIntoDataBaseErrorState());
    });
  }

  List<Map> products = [];
  List<Map> fav = [];
  List<ProductModel> allProducts = [];

  void getDataFromDatabase(database) async {
    products = [];
    fav = [];
    try {
      var data = await database.rawQuery('SELECT DISTINCT * from cart');
      var data2 = await database.rawQuery('SELECT DISTINCT * from fav');
      var data3 = await database.rawQuery('SELECT DISTINCT * from data');
      for (var element in data) {
        products.add(element);
      }
      for (var element in data3) {
        allProducts.add(ProductModel.fromJson(element));
      }
      for (var element in data2) {
        fav.add(element);
      }
      print(products);
      emit(GetDataFromDatabaseSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDataFromDatabaseErrorState());
    }
  }

  void getData() {
    emit(LoadingDataState());
    rootBundle.loadString(Assets.dataData).then((value) {
      var d = jsonDecode(value);
      d["data"].forEach((element) {
        data.add(ProductModel.fromJson(element));
      });
      for (var element in data) {
        insertIntoDataBase(
            image: '${element.image}',
            title: '${element.title}',
            price: '${element.price}',
            sizes: '${element.size}',
            description: '${element.subtitle}',
            table: 'data');
      }
      emit(GetDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataErrorState());
    });
  }

  void deleteData({required int id, required String table}) {
    database.rawDelete('DELETE FROM $table where id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(DeleteDataSuccessState());
    }).catchError((error) {
      emit(DeleteDataErrorState());
    });
  }
}
