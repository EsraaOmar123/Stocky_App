part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  final String error;

  LoginFailureState({required this.error});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final String userId;

  RegisterSuccessState({required this.userId});
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

class LogoutSuccessState extends AuthState {}
