import 'package:dating_app/common/constance/layout_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlgorithmSlideWidget extends StatelessWidget {
  final AnimationController animationController;
  const AlgorithmSlideWidget({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _algorithm =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2.4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _subtitle =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.only(top: 44.h),
      child: Column(
        children: [
          SlideTransition(
            position: _algorithm,
            child: Text(
              'Algorithm',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: LayOutConstance.layOutPaddingHoz),
            child: SlideTransition(
              position: _subtitle,
              child: Text(
                'Users going through a vetting process to ensure you never match with bots',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
