import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';
import 'package:dating_app/presentation/journey/tabbar/tabbar_item.dart';
import 'package:dating_app/presentation/journey/tabbar/widgets/botom_navigator_widget.dart';

import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  final AppStateViewModel appStateViewModel;
  const TabbarScreen({Key? key,required this.appStateViewModel}) : super(key: key);

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  late TabController tabController;
  final SocketClient socketClient=getIt<SocketClient>();
  @override
  void initState() {
    log('message');
    socketClient.connect();

    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: TabBarView(
        physics:tabController.index==0? NeverScrollableScrollPhysics():null,
          controller: tabController,
          children: tabBarItem.values.map((e) => e.getScreen(widget.appStateViewModel)).toList()),
      bottomNavigationBar: BottomNavigatorWidget(
        controller: tabController,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
