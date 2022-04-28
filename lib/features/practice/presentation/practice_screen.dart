




import 'package:flutter/material.dart';
import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/practice/data/practice_assessment_arguments.dart';
import 'package:idream/features/practice/data/practice_model.dart';
import 'package:idream/features/practice/presentation/practice_assessment_screen.dart';
import 'package:idream/features/practice/repository/topics_repository.dart';
import 'package:idream/utils/extension.dart';

class PracticeScreen extends StatelessWidget {
  static const String route ='practice_screen';
  final SubjectModel subjectModel;
  final TopicRepository topicRepository =TopicRepository();
  
   PracticeScreen(this.subjectModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectModel.name,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
        actions: [
              Center(
                child: Container(
                      width: 40,height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: fromHex(subjectModel.color),
                        image: DecorationImage(image: NetworkImage(subjectModel.icon))
                      ),
                    ),
              ),
              SizedBox(width: 10,),
        ],
      ),


      body: Column(
        children: [

          Expanded(
            child: FutureBuilder<List<PracticeModel>>(
              future: topicRepository.getPracticeList(subjectModel.id),
              builder: (context,future){
                if(future.hasData && future.data != null){
                 return  ListView.builder(
                   
                    itemCount: future.data!.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        dense: true,
                        onTap: (){
                          Navigator.pushNamed(context, PracticeAssessmentScreen.route,arguments:PracticeAssessmentScreenArguments(subjectModel, future.data![index]));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent.shade100,
                          child: Text(index.toString()),
                        ),
                        title: Text(future.data![index].tName,style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("${future.data![index].streakCount} Attempt",style: TextStyle(fontWeight: FontWeight.bold),),
                      );
          
          
                  });
                }
              return const Center(child: CircularProgressIndicator());
            }),
          )
       
        ],
      ),
   
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.video_file),label: "Videos"),
           BottomNavigationBarItem(icon:  Icon(Icons.analytics),label: "Practice"),
             BottomNavigationBarItem(icon:  Icon(Icons.notes_outlined),label: "Notes"),
                BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: "Boooks"),


      ],selectedItemColor: Colors.blueAccent,unselectedItemColor: Colors.black54,unselectedLabelStyle: TextStyle(color: Colors.black54),showUnselectedLabels: true,),

    );
  }


}