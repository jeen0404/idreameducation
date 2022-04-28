


import 'package:firebase_database/firebase_database.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/practice/data/question_model.dart';
import 'package:idream/features/user/domain/user_model.dart';

class AssessMentRpository{
  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
  UserModel userModel=UserHive().get()!;
  AppCacheHive appCacheHive=AppCacheHive();


  Future<List<QuestionModel>> getQuestions(String paperId)async{
    DatabaseReference databaseReference=firebaseDatabase.ref('qu_db_classwise/${userModel.studentClass}/$paperId');
    DataSnapshot dataSnapshot=await databaseReference.get();
    List<QuestionModel> questionModels=[];
    if(dataSnapshot.exists){
      
      List<Object?> i=dataSnapshot.children.first.value as List<Object?>;
      for (var element in i) { 
        Map x=element as Map;
        x.forEach((key, value) { 
           questionModels.add(QuestionModel.fromJson(value));
        });
      }
      return questionModels;
    }
    return [];

  }

}