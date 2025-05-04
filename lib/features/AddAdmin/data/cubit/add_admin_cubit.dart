import 'package:admin_dashboard_e__commerce/core/API_services.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  
  final ApiService _apiServices = ApiService();

  Future<void> createAnAccount(Map<String, dynamic> data) async {
    emit(AddAdminLoading());
    try {
      emit(AddAdminLoading());
      Response response = await _apiServices.createAnAccount("signup", data);
      if (response.statusCode == 200) {
        emit(AddAdminSuccess());
      } else {
        emit(AddAdminError(msgError: response.data["msg"]));
      }
    } catch (e) {
      print(e.toString());
      emit(AddAdminError(msgError: "Something went wrong , please try again"));
    }
  }
}
