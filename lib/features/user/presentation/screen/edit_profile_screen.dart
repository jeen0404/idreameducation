import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/user/controllers/edit_profile_cubit.dart';


class EditProfileScreen extends StatefulWidget {
  static const String route='edit_profile_screen';
    
  late final EditProfileCubit editProfileCubit;

   EditProfileScreen({ Key? key }) : super(key: key){
    editProfileCubit=EditProfileCubit();
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.editProfileCubit.scaffoldkey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Edit Profile",  style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
      actions: [
          IconButton(onPressed: (){}, icon: Text("Save",style: TextStyle(color: Colors.blue),))
      ],
      ),
      body: BlocBuilder<EditProfileCubit,EditProfileCubitState>(
        bloc: widget.editProfileCubit,
        builder: (context,editProfileCubitState){
        return  Column(
      children:  [
          const SizedBox(
            height: 20,
          ),
         const Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
            radius: 40,
          )),
         const SizedBox(
            height: 10,
          ),

            Divider(),

             ListTile(title: const Text("Full Name"),leading: IconButton(icon: const Icon(Icons.title_outlined),onPressed: (){},
             ),
          trailing: SizedBox(width: 150,child: TextField(
            controller: widget.editProfileCubit.fullName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            decoration:const InputDecoration(
              hintText: "Enter Name Here"
            ),),)
             ),

            ListTile(title: const Text("Board"),leading: IconButton(icon: const Icon(Icons.place_outlined),onPressed: (){},),
             trailing:DropdownButton<String>(
               value: widget.editProfileCubit.board,
            items: <String>['cbse', 'msbshse', 'uk'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_){
              widget.editProfileCubit.board=_!;
           setState((){});
            },
          )
              ,
             ),


            ListTile(title: const Text("Class"),leading: IconButton(icon: const Icon(Icons.class_outlined),onPressed: (){},),
             trailing:DropdownButton<String>(
               value: widget.editProfileCubit.studentClass,
            items: <String>['1','2','3','4','5','6','7','8','9','10'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged:(_){
              widget.editProfileCubit.studentClass=_!;
           setState((){});
            },
          ),
             ),


            ListTile(title: const Text("Language"),leading: IconButton(icon: const Icon(Icons.language_outlined),onPressed: (){},),
            trailing:DropdownButton<String>(
              value: widget.editProfileCubit.langunage,
            items: <String>['english','hindi'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged:(_){
              widget.editProfileCubit.langunage=_!;
           setState((){});
            },
          ),
             ),


      const Expanded(child: SizedBox()),

       editProfileCubitState is ShowProgressEditProfileCubitState?CupertinoButton(child:  SizedBox(height: 20,width: 20,child: const CircularProgressIndicator(color: Colors.white,)),onPressed: (){},color: Colors.blueAccent,):CupertinoButton(child:  Text("Save"),onPressed: (){
        widget.editProfileCubit.saveData;
       },color: Colors.blueAccent,),
      
      const SizedBox(height: 20,),

      ],


    );
      })
    ); }
}