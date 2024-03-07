import 'package:flutter/material.dart';
import 'package:project1/core/widgets/app_colors.dart';
import '../../../../data/models/account_tile_model.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({super.key, required this.accountItem});
  final AccountModel accountItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        accountItem.leadingIcon,
        size: 20,
        color: const Color(AppColors.kBlackColor),
      ),
      title: Text(
        accountItem.title,
        style:
            const TextStyle(fontSize: 18, color: Color(AppColors.kBlackColor)),
      ),
      trailing: accountItem.trailing ??
          const Icon(
            Icons.chevron_right_outlined,
            size: 20,
            color: Color(AppColors.kBlackColor),
          ),
      onTap: accountItem.onTap(),
    );
  }
}
