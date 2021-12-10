import 'package:dating_app/common/icons/datting_icons.dart';
import 'package:dating_app/presentation/journey/account_screen/account_screen.dart';
import 'package:dating_app/presentation/journey/home_screen/home_screen.dart';
import 'package:dating_app/presentation/journey/match_screen/match_screen.dart';
import 'package:dating_app/presentation/journey/message_screen/message_screen.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';
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
  Widget getScreen(AppStateViewModel appStateViewModel){
    switch(this){
      case tabBarItem.Home:
        return HomeScreen();
      case tabBarItem.Match:
        return MatchScreen();
      case tabBarItem.message:
        return  MessageScreen();
      case tabBarItem.account:
        return  AccountScreen(appStateViewModel: appStateViewModel,);
    }
  }
}