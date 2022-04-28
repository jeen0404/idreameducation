import 'package:flutter/material.dart';
import 'package:idream/features/auth/presentation/screen/login_screen.dart';
import 'package:idream/features/home/presentation/screen/main_sceen.dart';


Route<dynamic> authappRoute(RouteSettings routeSettings) {
  //final arguments = routeSettings.arguments;

  /// for handline parms
  switch (routeSettings.name) {

  /// in dafult route user will land in main screen
    default:
      return MaterialPageRoute(builder: (_) =>  LoginScreen());
  }
}