import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project1/features/home/presentation/views/widgets/custom_product_list_item.dart';
import 'package:swipe_to/swipe_to.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) => SwipeTo(
        onRightSwipe: (v) {},
        child: const CustomProductListItem(),
      ),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: 10,
    );
  }
}
