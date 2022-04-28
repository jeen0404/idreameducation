import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/app_start/controllers/app_start_cubit.dart';
import 'package:idream/features/user/domain/user_model.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile_screen';

  late UserModel userModel;
  ProfileScreen({Key? key}) : super(key: key) {
    userModel = UserHive().get()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(userModel.profilePhoto),
            radius: 40,
          )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children:  [
              const SizedBox(
                height: 10,
              ),
             const  Expanded(
                  child:  Divider(
                thickness: 2,
              )),
            Text("    ${userModel.fullName}    ",style: const TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
             const  Expanded(
                  child: Divider(
                thickness: 2,
              )),
              const SizedBox(
                height: 10,
              ),
           
            ],
          ),

             ListTile(title: const Text("Class"),leading: IconButton(icon: const Icon(Icons.class_outlined),onPressed: (){},),
             trailing: ActionChip(label: Text(userModel.studentClass,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){},),
             ),

              ListTile(title: const Text("Language"),leading: IconButton(icon: const Icon(Icons.class_outlined),onPressed: (){},),
             trailing: ActionChip(label: Text(userModel.language,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){},),
             ),

            ListTile(title: const Text("Board"),leading: IconButton(icon: const Icon(Icons.class_outlined),onPressed: (){},),
             trailing: ActionChip(label: Text(userModel.boardId.toUpperCase(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){},),
             ),

             Expanded(child: Container()),
           
             Row(
            children:   [
              const SizedBox(
                height: 20,
              ),
            const Expanded(
                  child:  Divider(
                thickness: 2,
              )),
              ActionChip(label: const Text("Log-out",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),backgroundColor: Colors.transparent,onPressed: (){
                BlocProvider.of<AppStartCubit>(context).logOut();
              }),
             const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              const SizedBox(
                height: 20,
              ),
           
            ],
          ),
         
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
