import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project1/authentication/controller/auth_cubit.dart';
import 'package:project1/core/api/api_constant.dart';
import 'package:project1/core/cubit/app_cubit.dart';
import 'package:project1/core/cubit/observer/blocObserver.dart';
import 'package:project1/core/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/firebase_options.dart';
import 'core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          BlocProvider(create: (context) => AppCubit()..createDataBase()),
          BlocProvider(create: (context) => AuthCubit()),
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
