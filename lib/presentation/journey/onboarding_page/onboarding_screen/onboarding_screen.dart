import 'dart:developer';

import 'package:dating_app/common/constance/route_constance.dart';
import 'package:dating_app/common/utils/color_hex.dart';
import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/widgets/algorithm_slide.dart';
import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/widgets/matches_widget.dart';
import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/widgets/page_view_widget.dart';
import 'package:dating_app/presentation/journey/onboarding_page/onboarding_screen/widgets/premium_widget.dart';
import 'package:dating_app/presentation/journey/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final pageViewController = PageController(viewportFraction: 0.7);
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    _animationController.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

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
            child: PageViewWidget(
              pageController: pageViewController,
              animationController: _animationController,
            ),
          ),
          Stack(
            children: [
              AlgorithmSlideWidget(animationController: _animationController),
              MatchesWidget(animationController: _animationController),
              PremiumWidget(animationController: _animationController)
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          // AnimationBu(position: _topMoveAnimation, child: _pageView()),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return _pageView();
            },
          ),
          SizedBox(
            height: 42.h,
          ),
          ButtonWidget(buttonTxt: 'Create an account', onTap: () {}),
          SizedBox(
            height: 36.h,
          ),
          _richText(context)
        ],
      )),
    );
  }

  Widget _richText(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Already have an account? ',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RouteList.singIn);
          },
          child: Text(
            'Sign In',
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: ColorsHex.getColorFromHex('#E94057')),
          ),
        )
      ],
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;
    if (_animationController.value == 0) {
      _selectedIndex = 0;
    } else if (_animationController.value == 0.2) {
      _selectedIndex = 1;
    } else if (_animationController.value == 0.4) {
      _selectedIndex = 2;
    } else {
      _selectedIndex = 3;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.all(4),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 480),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: _selectedIndex == i
                    ? Theme.of(context).buttonColor
                    : Color(0xff000000).withOpacity(0.1),
              ),
              width: 10.h,
              height: 10.h,
            ),
          )
      ],
    );
  }
}
