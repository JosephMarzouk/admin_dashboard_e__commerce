import 'package:admin_dashboard_e__commerce/core/components/cahchedImage.dart';
import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/functions/navigateTo.dart';
import 'package:admin_dashboard_e__commerce/features/Home/data/models/productmodel.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key, this.deleteProduct,
  });
  
  //final ProductModel product;
  final void Function()? deleteProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             CaheImage(
              height: 150,
              width: 200,
              url:
                 // product.imageUrl ??
                   "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1736199951~exp=1736203551~hmac=4002ca903018a0edb3f886536eb961659f89a39eb31ee90a093c352ac11e5912&w=826",
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                 Text(
                 // product.productName ?? 
                  "Product Name",
                  style:const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                 // product.description ??
                   "Product Description",
                  style:const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  child: const Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                 Text(
                 // product.price ?? 
                  "Product Price",
                  style:const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  //"${product.sale}",
                  "Product Sale",
                  style:const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  child: const Icon(Icons.comment),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: CustomElevatedButton(
                onPressed: deleteProduct,
                child: const Row(
                  children: [
                    Icon(Icons.delete),
                    Text("Delete"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}