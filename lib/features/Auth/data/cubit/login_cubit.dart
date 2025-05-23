
import 'package:admin_dashboard_e__commerce/core/API_services.dart';
import 'package:admin_dashboard_e__commerce/core/shared_prefreence.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ApiService _apiServices = ApiService();

  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      Response response = await _apiServices.login("token", data);
      if (response.statusCode == 200) {
        await SharedPref.saveToken(response.data["access_token"]);
        print(response);
        
        emit(LoginSuccess());
      } else {
        emit(LoginError(msgError: response.data["msg"]));
      }
    } catch (e) {
      emit(LoginError(msgError: "Something went wrong , please try again"));
    }
  }
}
