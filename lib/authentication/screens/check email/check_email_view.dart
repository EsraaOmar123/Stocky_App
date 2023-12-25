import 'package:flutter/material.dart';
import '../../../models/check_email_model.dart';
import '../../components/common/check_email.appbar.dart';
import '../../components/common/check_email_body.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key, required this.checkEmailModel});
  final CheckEmailModel checkEmailModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkEmailAppbar(checkEmailModel.title),
      body: CheckEmailBody(
        bodyText: checkEmailModel.bodyText,
      ),
    );
  }
}
