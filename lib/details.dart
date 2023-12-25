import 'package:flutter/material.dart';
import 'package:project1/core/cubit/app_cubit.dart';
import 'package:project1/models/product_model.dart';

class ItemsDetails extends StatelessWidget {
  final ProductModel productData;
  const ItemsDetails({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${productData.title}'),
      ),
      body: Column(
        children: [
          Image.asset(
            '${productData.image}',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          Text(
            '${productData.title}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                '${productData.subtitle}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500]),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                '${productData.price}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Size :   38 40 42 44 ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                AppCubit.get(context).insertIntoDataBase(
                  image: '${productData.image}',
                  title: '${productData.title}',
                  price: '${productData.price}',
                  sizes: '${productData.size}',
                  description: '${productData.subtitle}',
                  table: 'cart',
                );
              },
              child: const Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }
}
