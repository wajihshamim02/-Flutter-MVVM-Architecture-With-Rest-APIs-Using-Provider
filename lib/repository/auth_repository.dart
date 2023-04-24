import '../data/network/BaseApiService.dart';
import '../data/network/NetworkApiServiice.dart';
import '../res/api_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginapi(dynamic data) async {
    try {
      dynamic reponse = _apiServices.GetpostApiServices(ApiUrl.loginurl, data);
      return reponse;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic reponse =
          _apiServices.GetpostApiServices(ApiUrl.registerurl, data);
      return reponse;
    } catch (e) {
      throw e;
    }
  }
}
