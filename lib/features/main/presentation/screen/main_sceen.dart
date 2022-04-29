import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/core/database/hive/cache_single_key.dart';
import 'package:idream/features/Main/controller/main_screen_cubit.dart';
import 'package:idream/features/home/presentation/home_screen.dart';
import 'package:idream/features/main/repository/update_class.dart';

import 'package:idream/features/user/domain/user_model.dart';
import 'package:idream/features/user/presentation/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  late UserModel userModel;
  MainScreen({Key? key}) : super(key: key) {
    userModel = UserHive().get()!;
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenBloc homeBloc = MainScreenBloc();

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
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.route),
                icon: const Icon(Icons.person_outline))
          ],
          title: Row(
            children: [
              Container(
                width: 92,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                          width: 52,
                          child: Text(
                            "Class ${widget.userModel.studentClass}",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.fade,
                          )),
                      SizedBox(
                        width: 20,
                        child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          itemBuilder: (context) => createClassList,
                          icon: const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.blueAccent,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Chip(
                avatar: const Icon(
                  Icons.language,
                  color: Colors.blue,
                ),
                label: Row(
                  children: [
                    Text(
                      " ${widget.userModel.language.substring(0, 2)}",
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
              ),
            ],
          ),
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

  List<PopupMenuEntry> get createClassList {
    List<PopupMenuEntry> items = [];
    for (int i in [for (var i = 1; i < 11; i += 1) i]) {
      items.add(PopupMenuItem(
          child: ListTile(
        onTap: () async {
          await UpdateClass().udateStudentClass(i.toString());
          setState(() {
            widget.userModel = UserHive().get()!;
          });
          Navigator.pop(context);
        },
        dense: true,
        leading: CircleAvatar(child: Text(i.toString())),
        title: Text('Class ' + i.toString()),
      )));
    }
    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('11_arts');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('11')),
      title: Text('11th arts'),
    )));

    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('11_commerce');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('11')),
      title: Text('11th commerce'),
    )));

    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('11_nonmedical_medical');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('11')),
      title: Text('11th nonmedical medical'),
    )));
    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('12_arts');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('12')),
      title: Text('12th arts'),
    )));

    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('12_commerce');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('12')),
      title: Text('12th commerce'),
    )));

    items.add(PopupMenuItem(
        child: ListTile(
      onTap: () async {
        await UpdateClass().udateStudentClass('12_nonmedical_medical');
        setState(() {
          widget.userModel = UserHive().get()!;
        });
        Navigator.pop(context);
      },
      dense: true,
      leading: CircleAvatar(child: Text('12')),
      title: Text('12th nonmedical medical'),
    )));
    return items;
  }
}
