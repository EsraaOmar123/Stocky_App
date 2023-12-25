import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/authentication/controller/auth_cubit.dart';
import 'package:project1/authentication/controller/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:project1/authentication/screens/login_screen/login_screen.dart';
import 'package:project1/authentication/screens/register_screen/register_screen.dart';
import 'package:project1/home_page.dart';

import '../../authentication/controller/login google cubit/login_google_cubit.dart';
import '../../authentication/screens/check email/check_email_view.dart';
import '../../models/check_email_model.dart';
import '../../onBoarding/presentation/view/screens/onboarding_view.dart';

abstract class AppRoutes {
  static const String homeView = '/homeView';
  static const String searchView = '/SearchView';
  static const String onboardingView = '/';
  static const String loginView = '/loginView';
  static const String registerView = '/RegisterView';
  static const String checkEmail = '/checkEmail';

  static final router = GoRouter(
    routes: <RouteBase>[
      /*GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),*/
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: onboardingView,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView(
              /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/);
        },
      ),
      GoRoute(
        path: loginView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginGoogleCubit(),
              ),
              BlocProvider(create: (context) => AuthCubit()),
              BlocProvider(create: (context) => ResetPasswordCubit()),
            ],
            child: const LoginScreen(
                /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/),
          );
        },
      ),
      GoRoute(
        path: registerView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterScreen(
                /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/),
          );
        },
      ),
      GoRoute(
        path: checkEmail,
        builder: (BuildContext context, GoRouterState state) {
          return CheckEmail(
            checkEmailModel: state.extra as CheckEmailModel,
          );
        },
      ),
    ],
  );
}
