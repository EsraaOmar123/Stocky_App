import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project1/features/home/presentation/manager/app%20cubit/app_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../../../core/widgets/flutter_toast.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is DeleteDataSuccessState) {
          showToast(
              message: 'delete from cart successfully',
              state: ToastState.warning);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return AppCubit.get(context).products.isEmpty
            ? const Center(child: Text('cart is Empty'))
            : ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) => SwipeTo(
                  onRightSwipe: (v) {
                    AppCubit.get(context).deleteData(
                        id: AppCubit.get(context).products[index]['id'],
                        table: 'cart');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(
                            AppCubit.get(context).products[index]['image'],
                          )),
                        ),
                      ),
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppCubit.get(context).products[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 19),
                          ),
                          Text(
                            AppCubit.get(context).products[index]
                                ['description'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            AppCubit.get(context).products[index]['price'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const Gap(20),
                itemCount: AppCubit.get(context).products.length,
              );
      },
    );
  }
}
