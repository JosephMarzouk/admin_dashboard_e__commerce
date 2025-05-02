
import 'package:admin_dashboard_e__commerce/core/appcolors.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(BuildContext context, String title,
    {bool isBackButton = true}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: AppColors.kWhiteColor),
    ),
    backgroundColor: AppColors.kPrimaryColor,
    leading: isBackButton
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.kWhiteColor,
            ),
          )
        : Container(),
  );
}
