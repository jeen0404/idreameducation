


 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/app_start/controllers/app_start_cubit.dart';
import 'package:idream/features/user/presentation/screen/profile_screen.dart';

Widget get mainAppBarPopUpMenu =>   PopupMenuButton(itemBuilder: (context)=>[
              PopupMenuItem(child: ListTile(
                onTap: ()=>Navigator.pushNamed(context, ProfileScreen.route),
                leading: IconButton(icon:const Icon(Icons.person_outline),onPressed: (){}, ),
                title: Text("Profile"),
              )),


              PopupMenuItem(child: ListTile(
                leading: IconButton(icon:const Icon(Icons.settings_outlined),onPressed: (){}, ),
                title: Text("Settings"),
              )),


              PopupMenuItem(child: ListTile(
                leading: IconButton(icon:const Icon(Icons.info_outline),onPressed: (){}, ),
                title: Text("About"),
              )),


                PopupMenuItem(child: ListTile(
                  onTap: ()=>BlocProvider.of<AppStartCubit>(context).logOut(),
                leading: IconButton(icon:const Icon(Icons.login_outlined),onPressed: (){}, ),
                title: Text("Log-Out"),
              )),
            ],icon: Icon(Icons.more_vert_outlined),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            );