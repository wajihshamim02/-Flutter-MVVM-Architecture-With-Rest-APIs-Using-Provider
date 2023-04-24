import 'package:flutter/cupertino.dart';
import 'package:mvvm_structure/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_structure/utils/routes/routes.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  get Loading => _loading;

  bool _signuploading = false;
  bool get signuploading => _signuploading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  signupLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  Future<void> loginapi(data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginapi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushbarmessage('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        Utils.flushbarmessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signupapi(data, BuildContext context) async {
    signupLoading(true);
    _myRepo.signupApi(data).then((value) {
      signupLoading(false);
      if (kDebugMode) {
        Utils.flushbarmessage('Signup Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      signupLoading(false);

      if (kDebugMode) {
        Utils.flushbarmessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
