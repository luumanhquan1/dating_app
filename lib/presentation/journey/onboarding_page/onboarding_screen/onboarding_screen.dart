import 'dart:math';

import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageViewController = PageController(viewportFraction: 0.7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 76.h,
            ),
            Container(
              height: 360.h,
              width: double.infinity,
              color: Colors.transparent,
              child: PageViewWidget(pageController: pageViewController,),
            )
          ],
        ),
      ),
    );
  }
}
