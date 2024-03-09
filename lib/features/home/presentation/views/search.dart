import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project1/core/widgets/custom_text_form_feild.dart';
import 'package:project1/features/home/presentation/manager/app%20cubit/app_cubit.dart';
import 'package:project1/features/home/presentation/views/details.dart';

import '../../../../core/utils/assets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    //List<ProductModel> models = [];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextFormField(
                  isPassword: false,
                  maxLine: 1,
                  controller: searchController,
                  onChanged: (value) {
                    return null;
                  },
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  label: 'search',
                ),
                ConditionalBuilder(
                    condition: state is! LoadingDataState,
                    builder: (context) => Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(15),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ItemsDetails()));
                              },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'sweatshirt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 19),
                                      ),
                                      Text(
                                        'nice sweatshirt with a good quality',
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
                          ),
                        ),
                    fallback: (context) => const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        )),
              ],
            ),
          ),
        );
      },
    );
  }
}
