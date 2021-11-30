import 'package:dating_app/common/icons/datting_icons.dart';
import 'package:dating_app/presentation/journey/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum tabBarItem{Home,Match,message,account}
extension tabbarEx on tabBarItem{
    IconData icon(){
       switch(this){
         case tabBarItem.Home:
           return MyFlutterApp.book;
         case tabBarItem.Match:
           return MyFlutterApp.vector;
         case tabBarItem.message:
           return MyFlutterApp.facebook_messenger;
         case tabBarItem.account:
           return MyFlutterApp.people;
       }
  }
  Widget getScreen(){
    switch(this){
      case tabBarItem.Home:
        return HomeScreen();
      case tabBarItem.Match:
        return Scaffold();
      case tabBarItem.message:
        return  Scaffold();
      case tabBarItem.account:
        return  Scaffold();
    }
  }
}