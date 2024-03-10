import 'package:flutter/material.dart';
import '../../data/models/user details model/user_details.dart';
import 'widgets/edit account widgets/edit_account_view_body.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditAccountViewBody(
        user: UserDetailsModel(
            email: 'eomar2057@gmail.com',
            name: 'Esraa omar',
            phoneNumber: '0123456789',
            customerId: '',
            photo:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/542px-Unknown_person.jpg',
            token: '',
            id: ''),
      ),
    );
  }
}
