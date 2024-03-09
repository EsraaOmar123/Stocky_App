import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:project1/core/widgets/flutter_toast.dart';
import 'package:project1/features/home/presentation/manager/app%20cubit/app_cubit.dart';

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

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is InsertIntoDataBaseSuccessState) {
          showToast(message: 'Added Successfully', state: ToastState.success);
        }
      },
      builder: (context, state) {
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
              ConditionalBuilder(
                  condition: true,
                  builder: (context) => GridView.builder(
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 230,
                          childAspectRatio: 1.7,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const ItemsDetails()),
                              );
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2.4,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                Assets.imagesSweatshirt),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        width: 300,
                                      ),
                                    ),
                                    const Text(
                                      'sweatshirt',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'sweatshirt with a good quality material and price is affordable for you',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  fallback: (context) => Container(
                      width: 50,
                      margin: const EdgeInsets.only(
                        top: 28,
                      ),
                      height: 50,
                      child: const CircularProgressIndicator()))
            ],
          ),
        );
      },
    );
  }
}
