import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyBroadWidget extends StatelessWidget {
  const KeyBroadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 248.h,
      // width: 375.w,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 3.25,
        crossAxisSpacing: 6.w,
        mainAxisSpacing: 24.h,
        children: List.generate(12, (index) {
          if (index == 9) {
            return SizedBox();
          }
          if (index == 10) {
            return InkWellWidget(
              index: 0,
            );
          }
          return InkWellWidget(
            index: index + 1,
          );
        }),
      ),
    );
  }
}

class InkWellWidget extends StatelessWidget {
  final int index;
  const InkWellWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("$index");
      },
      child: Ink(
        color: Colors.transparent,
        width: 117.w,
        height: 36.h,
        child: Center(
          child:index==12? Icon(Icons.backspace_outlined):Text(
            '$index',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 24.sp),
          ),
        ),
      ),
    );
  }
}
