
import 'package:hive_flutter/hive_flutter.dart';

part 'practice_model.g.dart';


@HiveType(typeId: 3)
class PracticeModel {
  
  @HiveField(0)
  late String display;

  @HiveField(1)
  late String foundationalTopicId;
  
  @HiveField(2)
  late String incorrectStreak;

  @HiveField(3)
  late String levels;

  @HiveField(4)
  late String streakCount;

  @HiveField(5)
  late String tName;

  @HiveField(6)
  late String topicId;

  PracticeModel(this.display,this.foundationalTopicId,this.incorrectStreak,this.levels,this.streakCount,this.tName,this.topicId);

  static PracticeModel fromJson(map){
      return PracticeModel(map['display'], map['foundational_topic_id'], map['incorrect_streak'], map['levels'],map['streak_count'],map['t_name'],map['topic_id']);
  }

  static Map<String,dynamic> toMap(PracticeModel practiceModel){
    return <String,dynamic>{
      'display':practiceModel.display,
      'foundational_topic_id':practiceModel.foundationalTopicId,
      'incorrect_streak':practiceModel.incorrectStreak,
      'levels':practiceModel.levels,
      'streak_count':practiceModel.streakCount,
        't_name':practiceModel.tName,
          'topic_id':practiceModel.topicId
    };
  }

}