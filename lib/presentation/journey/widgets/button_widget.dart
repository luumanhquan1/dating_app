import 'package:dating_app/common/constance/boder_constance.dart';
import 'package:dating_app/common/utils/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonTxt;
  final Function() onTap;
  final bool isButtonColor;
  const ButtonWidget(
      {Key? key,
      required this.buttonTxt,
      required this.onTap,
      this.isButtonColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
          height: 56.h,
          width: 295.w,
          decoration: BoxDecoration(
              color: isButtonColor
                  ? Theme.of(context).buttonColor
                  : Colors.transparent,
              borderRadius: BorderConstance.borderRadius,
              border: isButtonColor
                  ? null
                  : Border.all(
                      color: ColorsHex.getColorFromHex('#F3F3F3'),
                      width: 1.sp)),
          child: Center(
            child: Text(
              buttonTxt,
              style: isButtonColor
                  ? Theme.of(context).textTheme.button
                  : Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.red),
            ),
          )),
    );
  }
}
