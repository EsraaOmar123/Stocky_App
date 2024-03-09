import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project1/core/widgets/flutter_toast.dart';
import 'package:project1/features/home/presentation/manager/app%20cubit/app_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../../../core/utils/assets.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is DeleteDataSuccessState) {
          showToast(
              message: 'delete from fav successfully',
              state: ToastState.warning);
        }
      },
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) => SwipeTo(
            onRightSwipe: (va) {},
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                      Assets.imagesSweatshirt,
                    )),
                  ),
                ),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'sweatshirt',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 19),
                    ),
                    Text(
                      'nice sweatshirt with a good quality ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      45.toString(),
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
          itemCount: 10,
        );
      },
    );
  }
}
