import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project1/core/widgets/app_colors.dart';
import '../../../../data/models/account_tile_model.dart';
import '../../../../data/models/user details model/user_details.dart';
import 'account_list_view.dart';
import 'logout_button.dart';
import 'user_details_listtile.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody(
      {super.key, required this.accountItems, required this.user});
  final List<AccountModel> accountItems;
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          UserDetailsListTile(
            user: user,
          ),
          const Divider(
            height: 1,
            color: Color(AppColors.kGreyColor),
          ),
          Expanded(
              child: AccountListview(
            accountItems: accountItems,
          )),
          const Gap(10),
          const LogoutAccountButton()
        ],
      ),
    );
  }
}
