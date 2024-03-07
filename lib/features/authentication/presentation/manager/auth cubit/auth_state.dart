part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final User user;

  LoginSuccessState({required this.user});
}

class LoginFailureState extends AuthState {
  final String error;

  LoginFailureState({required this.error});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final String userId;
  final User user;

  RegisterSuccessState({required this.userId, required this.user});
}

class RegisterFailureState extends AuthState {
  final String error;

  RegisterFailureState({required this.error});
}

class CreateUserSuccessState extends AuthState {}

class GetUserDataSuccessState extends AuthState {}

class UpdateUserDataSuccessState extends AuthState {}

class PickProfileImageSuccessState extends AuthState {}

class UploadProfileImageSuccessState extends AuthState {}
