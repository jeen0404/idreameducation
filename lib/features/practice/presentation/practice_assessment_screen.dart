




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/practice/controller/practice_assessment_cubit.dart';
import 'package:idream/features/practice/data/practice_assessment_arguments.dart';
import 'package:idream/features/practice/data/question_model.dart';
import 'package:idream/features/practice/repository/assessment_repository.dart';
import 'package:idream/utils/extension.dart';

// ignore: must_be_immutable
class PracticeAssessmentScreen extends StatelessWidget {
  late PracticeAssessmentScreenArguments pargs;
  PracticeAssessmentCubit practiceAssessmentCubit=PracticeAssessmentCubit();

  static const String route='Practice_assessment_screen';
  PracticeAssessmentScreen(this.pargs,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(pargs.practiceModel.tName,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),

      actions: [
           Center(
                child: Container(
                      width: 40,height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: fromHex(pargs.subjectModel.color),
                        image: DecorationImage(image: NetworkImage(pargs.subjectModel.icon))
                      ),
                    ),
              ),
              const SizedBox(width: 10,),
      ],
    ),

    body: Column(
      children: [
      const ListTile(minLeadingWidth: 40,title: Text("Mastry 0%",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
      )  ,
       Slider(value: 0, onChanged: (x){},min: 0,max: 100,activeColor: Colors.blue,),
       SizedBox( height: 20,),

       FutureBuilder<List<QuestionModel>>(
         future: AssessMentRpository().getQuestions(pargs.practiceModel.topicId),
         builder: (context,future){
           if(future.data==null || !future.hasData){
             return CircularProgressIndicator();
           }
           return Expanded(
             child: Column(
               children: [

                    BlocBuilder<PracticeAssessmentCubit,int>(
                      bloc: practiceAssessmentCubit,
                       buildWhen: (i,j){
                        return j<future.data!.length;
                      },
                      builder: (context,state){
                    return IndexedStack(
                          index: state,
                          children: createQuestionWidgetList(context, future.data!),);
                      }),

                    SizedBox(height: 20,),

                    CupertinoButton(child: Text("Next Question"), onPressed: (){
                      
                      practiceAssessmentCubit.moveToNext;
                    },color: Colors.blue,)

               ],
             ),
           );

       })

       
       
      
      ],
    ),
    );
  }


  List<Widget> createQuestionWidgetList(BuildContext context,List<QuestionModel> models){
    List<Widget> questionWidgets=[];

    for(QuestionModel questionModel in models){
      questionWidgets.add(     Column(
                   children: [
                    ListTile(title:  Text(questionModel.q),),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        width: MediaQuery.of(context).size.width-30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.black26)
                        ),
                        child: Row(
                          children: [
                            Chip(avatar: CircleAvatar(backgroundColor: Colors.black12,radius: 25,child: Text("a",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54),),),label:Text(questionModel.a,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),backgroundColor:Colors.transparent,),
                          ],
                        ),
                      ),
                        Container(
                        margin: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        width: MediaQuery.of(context).size.width-30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.black26)
                        ),
                        child: Row(
                          children: [
                            Chip(avatar: CircleAvatar(backgroundColor: Colors.black12,radius: 25,child: Text("b",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54),),),label:Text(questionModel.b,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),backgroundColor:Colors.transparent,),
                          ],
                        ),
                      ),Container(
                        margin: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        width: MediaQuery.of(context).size.width-30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.black26)
                        ),
                        child: Row(
                          children: [
                            Chip(avatar: CircleAvatar(backgroundColor: Colors.black12,radius: 25,child: Text("c",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54),),),label:Text(questionModel.c,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),backgroundColor:Colors.transparent,),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        width: MediaQuery.of(context).size.width-30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.black26)
                        ),
                        child: Row(
                          children: [
                            Chip(avatar: CircleAvatar(backgroundColor: Colors.black12,radius: 25,child: Text("d",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black54),),),label:Text(questionModel.d,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),backgroundColor:Colors.transparent,),
                          ],
                        ),
                      )
                   ],
                 )
           );
    }
      print(questionWidgets);
    return questionWidgets;

  }

}