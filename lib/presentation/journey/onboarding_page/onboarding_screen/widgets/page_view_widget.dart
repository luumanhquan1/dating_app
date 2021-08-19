import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewWidget extends StatefulWidget {
  final PageController pageController;
  const PageViewWidget({Key? key, required this.pageController})
      : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final List<String> listImg=['assets/imgs/girl1.png','assets/imgs/girl2.png','assets/imgs/girl3.png'];
  double viewportFraction = 0.7;
  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController
      ..addListener(() {
        setState(() {
          pageOffset = widget.pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset! - index).abs()) + viewportFraction);
        return Container(
          margin: EdgeInsets.only(
            right: 24.w,
            top: 50.h - scale * 25.h,
            bottom: 50.h - scale * 25.h,
          ),
        decoration: BoxDecoration(
            color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          image: DecorationImage(
            image: AssetImage(listImg[index]),
            fit: BoxFit.cover
          )
        ),

        );
      },
      itemCount: 3,
    );
  }
}
