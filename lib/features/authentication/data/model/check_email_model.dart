import 'package:firebase_auth/firebase_auth.dart';

class CheckEmailModel {
  final String title;
  final String bodyText;
  final User? user;

  CheckEmailModel({
    required this.title,
    required this.bodyText,
    this.user,
  });
}
