
import 'package:dating_app/common/constance/route_constance.dart';
import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/onboarding_screen.dart';
import 'package:dating_app/presentation/journey/onboarding_page/sign_in_screen/sing_in_screen.dart';
import 'package:flutter/cupertino.dart';

class RouteOnBoarding {
  static Map<String, WidgetBuilder> getAllOnBoarding(RouteSettings settings) {
    return {
      RouteList.onBoarding: (context) => OnBoardingScreen(),
      RouteList.singIn:(context)=>SingInScreen()
    };
  }
}
