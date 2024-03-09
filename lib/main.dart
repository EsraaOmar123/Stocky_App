import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project1/core/utils/api_constant.dart';
import 'package:project1/my_bloc_observer.dart';
import 'package:project1/core/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/firebase_options.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/constants.dart';
import 'features/authentication/presentation/manager/auth cubit/auth_cubit.dart';
import 'features/home/presentation/manager/app cubit/app_cubit.dart';
import 'features/profile/data/models/user details model/user_details.dart';
import 'features/profile/data/repos/account repo/account_repo_imp.dart';
import 'features/profile/data/repos/image repo/image_repo_imp.dart';
import 'features/profile/presentation/manager/capture photo cubit/capture_photo_cubit.dart';
import 'features/profile/presentation/manager/get user details cubit/get_user_details_cubit.dart';
import 'features/profile/presentation/manager/pick image cubit/pick_image_cubit.dart';
import 'features/profile/presentation/manager/uploud image cubit/uploud_image_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsModelAdapter());
  await Hive.openBox<UserDetailsModel>(kUserBox);
  Bloc.observer = MyBlocObserver();
  debugPrint(ApiConstant.userId);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
              create: (context) => GetUserDetailsCubit(AccountRepoImp())),
          BlocProvider(
            create: (context) => PickImageCubit(ImageRepoImp()),
          ),
          BlocProvider(create: (context) => UploudImageCubit(ImageRepoImp())),
          BlocProvider(
            create: (context) => CapturePhotoCubit(ImageRepoImp()),
          ),
        ],
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: Style.lightTheme,
            themeMode: ThemeMode.light,
            routerConfig: AppRoutes.router,
            builder: EasyLoading.init()),
      ),
    );
  }
}
