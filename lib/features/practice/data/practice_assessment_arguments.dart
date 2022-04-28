import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/practice/data/practice_model.dart';

class PracticeAssessmentScreenArguments {
  final SubjectModel subjectModel;
  final PracticeModel practiceModel;

  PracticeAssessmentScreenArguments(this.subjectModel, this.practiceModel);
}