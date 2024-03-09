import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sweatshirt'),
      ),
      body: Column(
        children: [
          Image.asset(
            Assets.imagesSweatshirt,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          const Text(
            'sweatshirt',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                'nice sweatshirt with a good quality ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500]),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                45.toString(),
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
              onPressed: () {},
              child: const Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }
}
