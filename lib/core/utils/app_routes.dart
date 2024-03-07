import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/features/authentication/presentation/manager/sign%20out%20cubit/sign_out_cubit.dart';
import 'package:project1/features/home/presentation/views/home_page.dart';
import '../../features/authentication/data/model/check_email_model.dart';
import '../../features/authentication/presentation/manager/auth cubit/auth_cubit.dart';
import '../../features/authentication/presentation/manager/login google cubit/login_google_cubit.dart';
import '../../features/authentication/presentation/manager/reset password cubit/reset_password_cubit.dart';
import '../../features/authentication/presentation/views/check_email_view.dart';
import '../../features/authentication/presentation/views/login_screen.dart';
import '../../features/authentication/presentation/views/register_screen.dart';
import '../../features/onBoarding/presentation/view/screens/onboarding_view.dart';
import '../../features/profile/data/repos/account repo/account_repo_imp.dart';
import '../../features/profile/presentation/manager/add user details/add_user_details_cubit.dart';
import '../../features/profile/presentation/views/edit_account_view.dart';

abstract class AppRoutes {
  static const String editAccountView = '/EditAccountView';
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
          return BlocProvider(
            create: (context) => SignOutCubit(),
            child: const HomePage(),
          );
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
              BlocProvider(create: (context) => SignOutCubit()),
              BlocProvider(create: (context) => ResetPasswordCubit()),
              BlocProvider(
                create: (context) => AddUserDetailsCubit(AccountRepoImp()),
              ),
            ],
            child: const LoginScreen(
                /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/),
          );
        },
      ),
      GoRoute(
        path: registerView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddUserDetailsCubit(AccountRepoImp()),
              ),
              BlocProvider(
                create: (context) => AuthCubit(),
              )
            ],
            child: const RegisterScreen(),
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
      GoRoute(
        path: editAccountView,
        builder: (BuildContext context, GoRouterState state) {
          return const EditAccountView();
        },
      ),
    ],
  );
}
