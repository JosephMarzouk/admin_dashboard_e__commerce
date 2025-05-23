import 'dart:typed_data';

import 'package:admin_dashboard_e__commerce/core/API_services.dart';
import 'package:admin_dashboard_e__commerce/core/shared_prefreence.dart';
import 'package:admin_dashboard_e__commerce/features/Home/data/models/productmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ApiService _apiServices = ApiService();

  List<ProductModel> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      

      Response response = await _apiServices.getData("products_table", );
      for (Map<String, dynamic> product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetProductsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetProductsError());
    }
  }

  // upload image to supabase storage
  String imageUrl = "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1736199951~exp=1736203551~hmac=4002ca903018a0edb3f886536eb961659f89a39eb31ee90a093c352ac11e5912&w=826";
  Future<void> uploadImage(
      {required Uint8List image,
      required String imageName,
      required String bucketName}) async {
    emit(UploadImageLoading());
    const String _storageBaseUrl =
        "https://asbxvyaxvraxpevngyjy.supabase.co/storage/v1/object";
    const String apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFzYnh2eWF4dnJheHBldm5neWp5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4NjMzMDQsImV4cCI6MjA1OTQzOTMwNH0.Z4LXgVoUqucTJ_Ggu-VYeNcB7HVveGIYoA1cPMRI1jE";
    final String? token = await SharedPref.getToken();
    print(token);
    final String uploadUrl = "$_storageBaseUrl/$bucketName/$imageName";
    final Dio _dio = Dio();
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(
        image,
        filename: imageName,
      ),
    });
    try {
      Response response = await _dio.post(
        data: formData,
        uploadUrl,
        options: Options(
          headers: {
            "apiKey": apiKey,
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      if (response.statusCode == 200) {
        imageUrl =
            "https://asbxvyaxvraxpevngyjy.supabase.co/storage/v1/object/public/${response.data["Key"]}";
        emit(UploadImageSuccess());
      } else {
        emit(UploadImageError());
      }
    } catch (e) {
      print(e.toString());
      emit(UploadImageError());
    }
  }

  // edit product
  Future<void> editProduct(
      {required Map<String, dynamic> data, required String productId}) async {
    emit(EditProductLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiServices.patchData(
          "products_table?product_id=eq.$productId", data, token);
      if (response.statusCode == 204) {
        emit(EditProductSuccess());
      } else {
        emit(EditProductError());
      }
    } catch (e) {
      emit(EditProductError());
    }
  }

  // delete product

  Future<void> deleteProduct({required String productId}) async {
    emit(DeleteProductLoading());
    try {
      String? token = await SharedPref.getToken();

      await _apiServices.deleteData(
          "favorite_products?for_product=eq.$productId", token); // delete the related favorite for this product
      await _apiServices.deleteData(
          "comments_table?for_product=eq.$productId", token); // delete the related rate for this product
      await _apiServices.deleteData(
          "purchesed_products_table?for_product=eq.$productId", token); // delete the related purchase for this product
      await _apiServices.deleteData(
          "rates_table?for_product=eq.$productId", token); // delete the related rate for this product
     
      // delete the product
      await _apiServices.deleteData(
          "products_table?product_id=eq.$productId", token);
      emit(DeleteProductSuccess());
    } catch (e) {
      print(e.toString());
      emit(DeleteProductError());
    }
  }

  // Add product
  Future<void> addProduct(
      {required Map<String, dynamic> data}) async {
    emit(AddProductLoading());
    try {
      String? token = await SharedPref.getToken();
       await _apiServices.postData(
          "products_table", data, token);
        emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductError());
    }
  }
}
