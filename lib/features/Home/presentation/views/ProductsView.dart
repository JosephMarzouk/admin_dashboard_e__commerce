import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: buildCustomAppBar(context, "Products"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => CustomProductCard(
            deleteProduct: () {},
            //product: null,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
