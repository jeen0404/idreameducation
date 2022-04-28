




import 'package:hive_flutter/hive_flutter.dart';

part 'subject_model.g.dart';


@HiveType(typeId: 2)
class SubjectModel {
  
  @HiveField(0)
  late String color;


  @HiveField(1)
  late String icon;
  
  @HiveField(2)
  late String name;

  @HiveField(3)
  late String id;

  @HiveField(4)
  late String shortName;

  SubjectModel(this.color,this.icon,this.name,this.id,this.shortName);

  static SubjectModel fromJson(map){
      return SubjectModel(map['color'], map['icon'], map['name'], map['id'],map['short_name']);
  }

  static Map<String,dynamic> toMap(SubjectModel subjectModel){
    return <String,dynamic>{
      'color':subjectModel.color,
      'icon':subjectModel.icon,
      'name':subjectModel.name,
      'id':subjectModel.id,
      'short_name':subjectModel.shortName
    };
  }

}