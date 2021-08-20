
import 'dart:ui';

import 'package:dating_app/common/constance/route_constance.dart';
import 'package:dating_app/routes.dart';
import 'package:dating_app/thems/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:()=> MaterialApp(
           theme: ThemeDataSetUp.themeDate,
       onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteList.onBoarding,
      ),
    );
  }
}

