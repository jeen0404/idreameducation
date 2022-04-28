import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/practice/data/practice_model.dart';
import 'package:idream/features/user/domain/user_model.dart';
import 'package:idream/features/user/presentation/screen/edit_profile_screen.dart';
import 'package:idream/firebase_options.dart';

abstract class AppStartCubitState{}

class AppStartedAppStartCubitState extends AppStartCubitState{}
class UnAuthenticatedAppStartCubitState extends AppStartCubitState{}
class AuthenticatedAppStartCubitState extends AppStartCubitState{
  late final String route;
  AuthenticatedAppStartCubitState({this.route="/"});
}


class AppStartCubit extends Cubit<AppStartCubitState>{

  AppStartCubit():super(AppStartedAppStartCubitState());

  void loadResources() async{
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(SubjectModelAdapter());
    Hive.registerAdapter(PracticeModelAdapter());
    await Hive.openBox('user_hive');
    await Hive.openBox('app_cache');
   // await Future.delayed(Duration(seconds: 2));
    checkAuthentication();
  }

  // check if user is loged-in in
  void checkAuthentication() async{
    if(FirebaseAuth.instance.currentUser==null){
      emit(UnAuthenticatedAppStartCubitState());
    }
    else{
      
      //if user is offline 
      if(UserHive().get()!=null){
        emit(AuthenticatedAppStartCubitState(route:'/'));
        final FirebaseDatabase database = FirebaseDatabase.instance;
        final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
        String? uId=FirebaseAuth.instance.currentUser?.uid;
        DataSnapshot databaseReference=await database.ref('users/students/$uId').get();
        // if user is online
        if(databaseReference.exists){
        UserHive().put(UserModel.fromJson(databaseReference.value));}
          
      }
      else{
        final FirebaseDatabase database = FirebaseDatabase.instance;
        final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
        String? uId=FirebaseAuth.instance.currentUser?.uid;
        DataSnapshot databaseReference=await database.ref('users/students/$uId').get();
        // if user is online
        if(databaseReference.exists){
        
        UserHive().put(UserModel.fromJson(databaseReference.value));
        emit(AuthenticatedAppStartCubitState(route: '/'));
        }
        else{
        emit(AuthenticatedAppStartCubitState(route: EditProfileScreen.route));
        }
      }
      
      }
  }

    //log out user from app
    void logOut()async{
      await FirebaseAuth.instance.signOut();
      await Hive.box('user_hive').clear();
      await Hive.box('user_hive').clear();
      
      emit(UnAuthenticatedAppStartCubitState());
  }

}