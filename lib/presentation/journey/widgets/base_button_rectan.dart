import 'package:flutter/material.dart';

class BaseButtonRectan extends StatelessWidget {
  final double size;
  final Function onTap;
  final Widget? icon;
  final Color? backgroundColor;
  const BaseButtonRectan(
      {Key? key,
      this.size = 52,
      required this.onTap,
      this.icon,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: const Color(0xffE8E6EA))),
        child: icon,
      ),
    );
  }
}
