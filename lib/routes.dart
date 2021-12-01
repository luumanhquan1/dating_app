import 'package:dating_app/common/constance/route_constance.dart';
import 'package:dating_app/presentation/journey/onboarding_page/route_boarding.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> generateRouteAll(RouteSettings settings) {
    return {
      ...RouteOnBoarding.getAllOnBoarding(settings),
    };
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.onBoarding:
      case RouteList.singIn:
      case RouteList.myMobile:
      case RouteList.otpScreen:
      case RouteList.profileScreen:
        return CupertinoPageRoute(
            builder: generateRouteAll(settings)[settings.name]!,
            settings: settings);
    }
  }
}
