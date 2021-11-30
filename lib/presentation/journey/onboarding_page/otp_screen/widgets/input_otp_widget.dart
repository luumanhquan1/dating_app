import 'package:dating_app/common/constance/boder_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputOtpWidget extends StatelessWidget {
  const InputOtpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        inputWidget(context),
        inputWidget(context),
        inputWidget(context),
        inputWidget(context)
      ],
    );
  }

  Widget inputWidget(BuildContext context) {
    return Container(
      width: 67.w,
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderConstance.borderRadius,
        color: Theme.of(context).buttonColor,
      ),
      child: Text(
        '7',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
