

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_structure/utils/routes/routes.dart';
import 'package:mvvm_structure/view/Login_View.dart';
import 'package:mvvm_structure/view/home_screen.dart';
import 'package:mvvm_structure/view/signup_view.dart';
import 'package:mvvm_structure/view/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name){
      case RoutesName.splash:
      return MaterialPageRoute(builder: ((context) => SplashView()));
      case RoutesName.login:
      return MaterialPageRoute(builder: ((context) => LoginView()));
       case RoutesName.signup:
      return MaterialPageRoute(builder: ((context) => SignupView()));
      case RoutesName.home:
      return MaterialPageRoute(builder: ((context) => HomeScreen()));
      default:
      return MaterialPageRoute(builder: (_){
        return Scaffold(
          body: Center(child: Text('No Route Found')),
        );
      });
    }

  }
}