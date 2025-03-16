import 'package:bloc_clean_coding/config/app_url.dart';
import 'package:bloc_clean_coding/data/network/network_api_service.dart';
import 'package:bloc_clean_coding/model/user/user_model.dart';

class LoginRepository {
  final _api = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.login, data);
    return UserModel.fromJson(response);
  }
}
