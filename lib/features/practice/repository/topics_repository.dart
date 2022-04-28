


import 'package:firebase_database/firebase_database.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/practice/data/practice_model.dart';
import 'package:idream/features/user/domain/user_model.dart';

class TopicRepository{

  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
  UserModel userModel=UserHive().get()!;
  AppCacheHive appCacheHive=AppCacheHive();

 Future< List<PracticeModel>> getPracticeList(String subject) async{
  String ref='topics/${userModel.boardId}/${userModel.language}/${userModel.studentClass}/subjects/$subject/practice';
    if(AppCacheHive().get(ref) != null){
      List<dynamic> listOfMap=AppCacheHive().get(ref);
      List<PracticeModel> listOfSubjects=[];
      listOfMap.forEach((element) {listOfSubjects.add(element);});
      return listOfSubjects;
    }
    else{
  DatabaseReference databaseReference=firebaseDatabase.ref(ref);
  DataSnapshot dataSnapshot= await databaseReference.get();
  if(dataSnapshot.exists){
  List<PracticeModel> listOfPractice=[];
   for (var element in dataSnapshot.children) { 
    listOfPractice.add(PracticeModel.fromJson(element.value));
     }
  AppCacheHive().put(ref, listOfPractice);
  return listOfPractice;
  }
  return [];
  }
  }
  
}