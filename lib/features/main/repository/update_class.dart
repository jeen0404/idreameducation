


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/practice/data/practice_model.dart';
import 'package:idream/features/user/domain/user_model.dart';

class UpdateClass{

  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
  UserModel userModel=UserHive().get()!;
  AppCacheHive appCacheHive=AppCacheHive();
   FirebaseAuth firebaseAuth=FirebaseAuth.instance;


 Future<void> udateStudentClass(String Studentclass) async{
  String? uId=FirebaseAuth.instance.currentUser?.uid;
  String ref='users/students/'+uId.toString();
  DatabaseReference databaseReference=firebaseDatabase.ref(ref);
  await databaseReference.update({'student_class':Studentclass});
  await UserHive().put(UserModel(userModel.fullName, userModel.language, userModel.language, Studentclass, userModel.boardId));
  return ;
  }
  
  
}