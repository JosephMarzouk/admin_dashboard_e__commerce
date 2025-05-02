
import 'package:admin_dashboard_e__commerce/core/appcolors.dart';
import 'package:flutter/material.dart';

class CustomCircleProgIndicator extends StatelessWidget {
  const CustomCircleProgIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
