import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swipe_to/swipe_to.dart';
import 'widgets/custom_product_list_item.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) => SwipeTo(
        onRightSwipe: (va) {},
        child: const CustomProductListItem(),
      ),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: 10,
    );
  }
}
