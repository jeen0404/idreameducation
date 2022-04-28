import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/Main/controller/main_screen_cubit.dart';
import 'package:idream/features/Main/presentation/widget/main_widget.dart';
import 'package:idream/features/home/presentation/home_screen.dart';

import 'package:idream/features/user/domain/user_model.dart';

class MainScreen extends StatelessWidget {
  MainScreenBloc homeBloc = MainScreenBloc();
  late UserModel userModel;
  MainScreen({Key? key}) : super(key: key){
    userModel=UserHive().get()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.list_rounded),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            mainAppBarPopUpMenu
          ],

          title: Row(children: [
            Chip(label: Row(
              children: [
                Text("Class ${userModel.studentClass}",style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                const Icon(Icons.arrow_drop_down_rounded,color: Colors.blueAccent,)
              ],
            ),backgroundColor: Colors.blueAccent.withOpacity(0.2),),
            const SizedBox(width: 10,),
            Chip(
              avatar: const Icon(Icons.language,color: Colors.blue,),label: Row(
              children: [
                Text(" ${userModel.language.substring(0,2)}",style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                const Icon(Icons.arrow_drop_down_rounded,color: Colors.blueAccent,)
              ],
            ),backgroundColor: Colors.blueAccent.withOpacity(0.2),),


          ],),

        ),
        body: BlocBuilder<MainScreenBloc, int>(
          bloc: homeBloc,
          builder: (context, index) {
            return IndexedStack(
              index: index,
              children: [HomeScreen(), Container()],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<MainScreenBloc, int>(
          bloc: homeBloc,
          builder: (context, index) {
            return BottomNavigationBar(
              currentIndex: index,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics_outlined), label: "My Report"),
              ],
              onTap: (i) => homeBloc.changeIndex(i),
            );
          },
        ));
  }
}
