import 'package:admin_dashboard_e__commerce/core/appcolors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMsg(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.kPrimaryColor,
  ));
}