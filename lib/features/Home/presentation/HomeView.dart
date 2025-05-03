import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/core/functions/navigateTo.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/AddAdminView.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/AddProductsView.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/ProductsView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Home", isBackButton: false),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.shopping_bag, size: 30)
                ],
              ),
              onPressed: () => navigateTo(context, const ProductsView()),
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.add_circle_outline, size: 30)
                ],
              ),
              onPressed: () => navigateTo(context, const AddProductView()),
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add An Admin",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.person_add, size: 30)
                ],
              ),
              onPressed: () => navigateTo(
                context,
                const AddAdminView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}