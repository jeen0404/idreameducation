



import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeAssessmentCubit extends Cubit<int>{
  
  PracticeAssessmentCubit():super(0);
  int index=0;
  
  void get moveToNext{
    index++;
    emit(index);
  }

}