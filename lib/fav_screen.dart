import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project1/core/components/flutter_toast.dart';
import 'package:project1/core/cubit/app_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is DeleteDataSuccessState) {
          showToast(
              message: 'delete from fav successfluy',
              state: ToastState.warning);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return AppCubit.get(context).fav.isEmpty
            ? const Center(child: Text('Fav is Empty'))
            : ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) => SwipeTo(
                  onRightSwipe: (va) {
                    AppCubit.get(context).deleteData(
                        id: AppCubit.get(context).fav[index]['id'],
                        table: 'fav');
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
                            AppCubit.get(context).fav[index]['image'],
                          )),
                        ),
                      ),
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppCubit.get(context).fav[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 19),
                          ),
                          Text(
                            AppCubit.get(context).fav[index]['description'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            AppCubit.get(context).fav[index]['price'],
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
                itemCount: AppCubit.get(context).fav.length,
              );
      },
    );
  }
}
