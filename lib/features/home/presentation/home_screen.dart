


import 'package:flutter/material.dart';
import 'package:idream/features/home/domain/subject_model.dart';
import 'package:idream/features/home/repository/subjects.dart';
import 'package:idream/features/practice/presentation/practice_screen.dart';
import 'package:idream/utils/extension.dart';

class HomeScreen extends StatelessWidget {
  SubjectsRepository subjectsRepository=SubjectsRepository();

  HomeScreen({ Key? key }) : super(key: key){

    subjectsRepository.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
              children: [
              ListTile(title: RichText(text: const TextSpan(text: "Your ",children: [TextSpan(text:"Subjects",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black87)),],style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: Colors.black87)),)),
              FutureBuilder<List<SubjectModel>>(
                future: subjectsRepository.getList(),
                builder: (context,future){
                  if(future.hasData){
                    return Wrap(
                      alignment: WrapAlignment.start,
                      children: createListOfSubjects(context,future.data!),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                  
              }),
             Divider(),
             const ListTile(title: Text("Books",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black87))),

        ],),
    );
  }




  List<Widget> createListOfSubjects(BuildContext context,List<SubjectModel> models){
    List<Widget> widgets=[];
    for (var element in models) { 
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=>Navigator.pushNamed(context, PracticeScreen.route,arguments: element),
            child: SizedBox(width: 80,height: 90,
              child:Column(
                children: [
                  Container(
                    width: 60,height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fromHex(element.color),
                      image: DecorationImage(image: NetworkImage(element.icon))
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(child: SizedBox(width: 50,child: Text(element.name,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)),),
                 
                ],
              ),
            ),
          ),
        )
      );

    }
     return widgets;
  }
 

}