import 'package:flutter/material.dart';
import 'package:idream/features/Main/presentation/screen/main_sceen.dart';
import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/practice/data/practice_assessment_arguments.dart';
import 'package:idream/features/practice/presentation/practice_assessment_screen.dart';
import 'package:idream/features/practice/presentation/practice_screen.dart';
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

    case PracticeScreen.route:
       return MaterialPageRoute(builder: (_) =>  PracticeScreen(routeSettings.arguments as SubjectModel));

    
    case PracticeAssessmentScreen.route:
       return MaterialPageRoute(builder: (_) =>  PracticeAssessmentScreen(routeSettings.arguments as PracticeAssessmentScreenArguments));
    
  
    default:
      return MaterialPageRoute(builder: (_) =>  MainScreen());
  }
}