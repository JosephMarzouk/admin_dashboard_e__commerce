import 'package:admin_dashboard_e__commerce/core/components/customCircleProgressIndecator.dart';
import 'package:admin_dashboard_e__commerce/core/functions/ShowMSG.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/core/functions/navigateWIthoutBack.dart';
import 'package:admin_dashboard_e__commerce/features/Home/data/cubit/product_cubit.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/views/HomeView.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is DeleteProductSuccess) {
            showMsg(context, "Product deleted successfully");
            navigateWithoutBack(context, const HomeView());
          }
        },
        builder: (context, state) {
          ProductCubit cubit = context.read<ProductCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Products"),
            body: state is GetProductsLoading || state is DeleteProductLoading
                ? const CustomCircleProgIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => CustomProductCard(
                        deleteProduct: () {
                          cubit.deleteProduct(
                            productId: cubit.products[index].productId!,
                          );
                        },
                        product: cubit.products[index],
                      ),
                      itemCount: cubit.products.length,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
