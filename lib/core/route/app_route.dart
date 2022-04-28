import 'package:flutter/material.dart';
import 'package:idream/features/Main/presentation/screen/main_sceen.dart';
import 'package:idream/features/user/presentation/screen/edit_profile_screen.dart';
import 'package:idream/features/user/presentation/screen/profile_screen.dart';


Route<dynamic> appRoute(RouteSettings routeSettings) {
  //final arguments = routeSettings.arguments;

  /// for handline parms
  switch (routeSettings.name) {
    case ProfileScreen.route:
       return MaterialPageRoute(builder: (_) => ProfileScreen());

    case EditProfileScreen.route:
       return MaterialPageRoute(builder: (_) => EditProfileScreen());

  /// in dafult route user will land in main screen
    default:
      return MaterialPageRoute(builder: (_) =>  MainScreen());
  }
}