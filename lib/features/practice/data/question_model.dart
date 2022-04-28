
import 'package:hive_flutter/hive_flutter.dart';

part 'question_model.g.dart';


@HiveType(typeId: 4)
class QuestionModel {
  
  @HiveField(0)
  late String a;

  @HiveField(1)
  late String b;
  
  @HiveField(2)
  late String c;

  @HiveField(3)
  late String d;

  @HiveField(4)
  late String q;

  @HiveField(5)
  late String correctFeedback;

  @HiveField(6)
  late String incorrectFeedback;

  QuestionModel(this.a,this.b,this.c,this.d,this.q,this.correctFeedback,this.incorrectFeedback);

  static QuestionModel fromJson(map){
      return QuestionModel(map['A']['value'], map['B']['value'], map['C']['value'], map['D']['value'],map['q'],map['correct_feedback'],map['incorrect_feedback']);
  }

  static Map<String,dynamic> toMap(QuestionModel practiceModel){
    return <String,dynamic>{
      'a':practiceModel.a,
      'b':practiceModel.b,
      'c':practiceModel.c,
      'd':practiceModel.d,
      'q':practiceModel.q,
        'correct_feedback':practiceModel.correctFeedback,
          'incorrect_feedback':practiceModel.incorrectFeedback
    };
  }

}