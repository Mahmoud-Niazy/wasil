import 'package:wasil/core/api_services/api_services.dart';
import 'package:wasil/features/auth/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> userSignUp(Map<String, dynamic> userData);

  Future<UserModel> userSignIn(Map<String, dynamic> userData);
}

class AuthDataSourceImp extends AuthDataSource {
  ApiServices apiServices;

  AuthDataSourceImp(this.apiServices);

  @override
  Future<UserModel> userSignUp(Map<String, dynamic> userData) async {
    var response = await apiServices.postData(
      path: 'user/register',
      data: userData,
    );

    UserModel user = UserModel.fromJson(response.data['data']);
    return user;
  }

  @override
  Future<UserModel> userSignIn(Map<String, dynamic> userData) async {
    var response = await apiServices.postData(
      path: 'user/login',
      data: userData,
    );

    UserModel user = UserModel.fromJson(response.data['data']);
    return user;
  }
}
