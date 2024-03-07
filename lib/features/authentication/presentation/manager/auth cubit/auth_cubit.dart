import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        debugPrint(
            '/////////////////////////////id//////////////////////////////////');
        debugPrint(credential.user?.uid ?? '');
        //myuserId = credential.user?.uid ?? '';
        emit(LoginSuccessState(user: credential.user!));
      } else {
        emit(LoginFailureState(
            error: 'not verified , you shoud verified it first'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(
            error: 'sorry , user-not-found , try again with correct user'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            error: 'wrong-password ! , try enter it correctly'));
      } else {
        emit(LoginFailureState(error: e.toString()));
      }
    }
  }

  void userRegister(
      {required String email,
      required String password,
      required String name}) async {
    try {
      emit(RegisterLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();

      User user = credential.user!;
      emit(RegisterSuccessState(userId: credential.user!.uid, user: user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            error: 'The account already exists for that email.'));
      } else {
        emit(RegisterFailureState(error: e.toString()));
      }
    } catch (e) {
      emit(RegisterFailureState(error: e.toString()));
    }
  }
}
