



import 'package:firebase_database/firebase_database.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/user/domain/user_model.dart';

class SubjectsRepository{
  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
  UserModel userModel=UserHive().get()!;

  Future<List<SubjectModel>> getList() async{
    if(AppCacheHive().get('subject_${userModel.studentClass}') != null){
      List<dynamic> listOfMap=AppCacheHive().get('subject_${userModel.studentClass}');
      List<SubjectModel> listOfSubjects=[];
      listOfMap.forEach((element) {listOfSubjects.add(element);});
      return listOfSubjects;
    }
    else{
    DatabaseReference databaseReference=firebaseDatabase.ref('subjects/${userModel.boardId}/${userModel.language}/${userModel.studentClass}');
    DataSnapshot dataSnapshot=await databaseReference.get();
    if(dataSnapshot.exists){
      List<SubjectModel> subjectModels=[];
      dataSnapshot.children.forEach((element) {subjectModels.add(SubjectModel.fromJson(element.value));});
      AppCacheHive().put('subject_${userModel.studentClass}',subjectModels);
      print("done--");
      return subjectModels;
    }
    return [];
    }

  }
}

class BooksRepository{
  
}