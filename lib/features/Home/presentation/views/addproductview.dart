import 'dart:typed_data';

import 'package:admin_dashboard_e__commerce/core/components/cahchedImage.dart';
import 'package:admin_dashboard_e__commerce/core/components/customElevatedButton.dart';
import 'package:admin_dashboard_e__commerce/core/components/customTextField.dart';
import 'package:admin_dashboard_e__commerce/core/functions/ShowMSG.dart';
import 'package:admin_dashboard_e__commerce/core/functions/buid_custom_appbar.dart';
import 'package:admin_dashboard_e__commerce/core/functions/navigateWIthoutBack.dart';
import 'package:admin_dashboard_e__commerce/core/functions/pick_image.dart';
import 'package:admin_dashboard_e__commerce/features/Home/data/cubit/product_cubit.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  String selectedValue = "Collections";
  String discount = "10";
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  Uint8List? _selectedImage;
  String _imageName = "imageName";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
         if (state is AddProductSuccess) {
            showMsg(context, "Product added successfully");
            navigateWithoutBack(context, const HomeView());
          }
        },
        builder: (context, state) {
          ProductCubit cubit = context.read<ProductCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Add Product"),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownMenu(
                        onSelected: (String? value) {
                          setState(() {
                            selectedValue = value ?? "Collections";
                          });
                        },
                        initialSelection: selectedValue,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: "sports", label: "Sports"),
                          DropdownMenuEntry(
                              value: "electronics", label: "Electronics"),
                          DropdownMenuEntry(
                              value: "collections", label: "Collections"),
                          DropdownMenuEntry(value: "books", label: "Books"),
                          DropdownMenuEntry(value: "bikes", label: "Bikes"),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Sale",
                          ),
                          Text(
                            "$discount %",
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _selectedImage != null
                              ? Image.memory(
                                  _selectedImage!,
                                  height: 200,
                                  width: 300,
                                )
                              : const CaheImage(
                                  url:
                                      "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1736199951~exp=1736203551~hmac=4002ca903018a0edb3f886536eb961659f89a39eb31ee90a093c352ac11e5912&w=826",
                                  height: 200,
                                  width: 300,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CustomElevatedButton(
                                child: const Icon(Icons.image),
                                onPressed: () async {
                                  await pickImage().then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _imageName = value.files.first.name;
                                        Uint8List? bytes =
                                            value.files.first.bytes;
                                        _selectedImage = bytes;
                                      });
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomElevatedButton(
                                onPressed: state is UploadImageLoading
                                    ? null
                                    : () async {
                                        if (_selectedImage != null) {
                                          await cubit.uploadImage(
                                            image: _selectedImage!,
                                            imageName: _imageName,
                                            bucketName: "images",
                                          );
                                        }
                                      },
                                child: const Icon(
                                  Icons.upload_file_rounded,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomField(
                    labelText: "Product Name",
                    controller: _productNameController,
                  ),
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
                      double x = ((double.parse(_oldPriceController.text) -
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
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Add"),
                      ),
                      onPressed: state is UploadImageLoading
                          ? null
                          : () async {
                              cubit.addProduct(data: {
                                "product_name": _productNameController.text,
                                "price": _newPriceController.text,
                                "old_price": _oldPriceController.text,
                                "sale": discount,
                                "description":
                                    _productDescriptionController.text,
                                "category": selectedValue,
                                "image_url": cubit.imageUrl
                              });
                            },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _newPriceController.dispose();
    _oldPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }
}
