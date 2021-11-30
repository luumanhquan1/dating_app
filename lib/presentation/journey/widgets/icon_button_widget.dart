import 'package:dating_app/common/constance/boder_constance.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget icon;
  final double? size;
  final Function() onTap;
  const IconButtonWidget(
      {Key? key, required this.icon, required this.onTap, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: size ?? 64.h,
        height: size ?? 64.h,
        decoration: BoxDecoration(
            borderRadius: BorderConstance.borderRadius,
            border: Border.all(
                color: Theme.of(context).canvasColor.withOpacity(0.1))),
        child: Container(child: icon),
      ),
    );
  }
}
