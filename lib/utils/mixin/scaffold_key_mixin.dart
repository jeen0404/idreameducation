import 'package:flutter/material.dart';



mixin ScaffoldKeyMixin{
late final GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();

void showSnackBar(String text,Icon icon){
 ScaffoldMessenger.of(scaffoldkey.currentContext!).showSnackBar(SnackBar(
   content: Container(
   decoration: (BoxDecoration(
     color: Colors.orangeAccent,
     borderRadius: BorderRadius.circular(15),
     boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 5,spreadRadius: 2)]
   )),
   child: Chip(avatar: icon,label: Text(text),backgroundColor: Colors.orangeAccent,labelStyle: const TextStyle(fontWeight: FontWeight.bold),),
 ),
 backgroundColor: Colors.transparent,
 elevation: 0,
 
 ));
}

}