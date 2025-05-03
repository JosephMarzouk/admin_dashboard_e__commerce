import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/components/customTextField.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  String? selectedValue;
  String? discount;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: buildCustomAppBar(context, "Edit Product"),
            body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        
                        const SizedBox(
                          height: 60,
                        ),
                        CustomField(
                          labelText: "Product Name",
                          controller: _productNameController,
                        ),
                        // 70
                        const SizedBox(
                          height: 10,
                        ),
                        CustomField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          labelText: "Old Price (Before Discount)",
                          controller: _oldPriceController,
                        ), // 249
                        const SizedBox(
                          height: 10,
                        ),

                        CustomField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          labelText: "New Price (After Discount)",
                          controller: _newPriceController,
                          onChanged: (String val) {
                            double x =
                                ((double.parse(_oldPriceController.text) -
                                        double.parse(val)) /
                                    double.parse(_oldPriceController.text) *
                                    100);
                            setState(() {
                              discount = x.round().toString();
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomField(
                          labelText: "Product Description",
                          controller: _productDescriptionController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomElevatedButton(
                            onPressed: ()
                                   {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Update"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        }    
}
