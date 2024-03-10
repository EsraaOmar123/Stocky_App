import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/utils/assets.dart';
import 'details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      {"iconName": Icons.woman, "title": "Woman"},
      {"iconName": Icons.man, "title": "Men"},
      {"iconName": Icons.card_giftcard, "title": "Gifts"},
      {"iconName": Icons.shop, "title": "Shop"},
      {"iconName": Icons.sell, "title": "Sell"},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(height: 30),
          const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[150],
                              borderRadius: BorderRadius.circular(130)),
                          color: Colors.grey[150],
                          padding: const EdgeInsets.all(10),
                          child: Icon(categories[i]['iconName'], size: 40),
                        ),
                        Text(
                          categories[i]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "best Selling",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GridView.builder(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 342),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ItemsDetails()),
                  );
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(Assets.imagesSweatshirt),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: double.infinity,
                          height: 150,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'sweatshirt',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'sweatshirt with a good quality material and price is affordable for you',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        const CustomPriceRow()
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(45.toString(),
            style: const TextStyle(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold)),
        IconButton(
          onPressed: () {},
          icon: const Icon(IconlyBroken.heart),
        ),
      ],
    );
  }
}
