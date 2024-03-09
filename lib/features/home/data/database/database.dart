/*import 'package:sqflite/sqflite.dart';

class DataBase {
  late Database database;

  void createDataBase() async {
    database = await openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE cart(id INTEGER PRIMARY KEY , title TEXT ,category TEXT ,date TEXT,startTime TEXT , endTime TEXT , description TEXT , status TEXT )')
            .then((value) {
          print('tabl');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (db) {
//        getDataFromDatabase(db);
      },
    );
  }

  void insertIntoDataBase({
    required String title,
    required String category,
    required String date,
    required String startTime,
    required String endTime,
    required String description,
  }) async {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks(title, category, date , startTime , endTime , description , status ) VALUES("$title", "$category", "$date" , "$startTime" , "$endTime" , "$description", "new" )');
    }).then((value) {
      print(value);
      getDataFromDatabase(database);
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<Map> tasks = [];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  void getDataFromDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    try {
      tasks = await database.rawQuery('SELECT * from tasks');
      tasks.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archivedTasks.add(element);
        } else if (element['status'] == 'delete') {
          deleteData(id: element['id']);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void updateData({required String status, required int id}) {
    database.rawUpdate(
        'UPDATE tasks SET status=? where id = ?', [status, id]).then((value) {
      getDataFromDatabase(database);
    }).catchError((error) {});
  }

  void deleteData({required int id}) {
    database
        .rawDelete('DELETE FROM tasks where id = ?', [id])
        .then((value) {})
        .catchError((error) {});
  }
}
*/