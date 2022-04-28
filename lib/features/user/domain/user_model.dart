
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';


@HiveType(typeId: 1)
class UserModel {
  
  @HiveField(0)
  late String fullName;


  @HiveField(1)
  late String language;
  
  @HiveField(2)
  late String profilePhoto;

  @HiveField(3)
  late String studentClass;

  @HiveField(4)
  late String boardId;

  UserModel(this.fullName,this.language,this.profilePhoto,this.studentClass,this.boardId);

  static UserModel fromJson(map){
      return UserModel(map['full_name'], map['language'], map['profile_photo'], map['student_class'],map['board_id']);
  }

  static Map<String,dynamic> toMap(UserModel userModel){
    return <String,dynamic>{
      'full_name':userModel.fullName,
      'language':userModel.language,
      'profile_photo':userModel.profilePhoto,
      'student_class':userModel.studentClass,
      'board_id':userModel.boardId
    };
  }

}