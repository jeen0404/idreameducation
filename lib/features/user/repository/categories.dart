import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:idream/features/user/controllers/edit_profile_cubit.dart';
import 'package:idream/features/user/domain/user_model.dart';
import '../../../core/database/hive/cache_single_key.dart';


class LoadDataForEditProfile{
  late final EditProfileCubit editProfileCubit;
  LoadDataForEditProfile(this.editProfileCubit);
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  void saveUser(UserModel userModel)async{
    String? uId=FirebaseAuth.instance.currentUser?.uid;
    print(uId.toString());
    DatabaseReference databaseReference=database.ref('users/students/'+uId.toString());
    await databaseReference.set(UserModel.toMap(userModel));
    Navigator.of(editProfileCubit.scaffoldkey.currentContext!).pushNamed('/');
    
  }

}