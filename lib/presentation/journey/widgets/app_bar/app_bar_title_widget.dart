import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTitleWidget extends StatelessWidget with PreferredSizeWidget {
  final Widget? titleIcon;
  final Widget? actionIcon;

  final bool isBorderLeading;
  const AppBarTitleWidget(
      {Key? key, this.titleIcon, this.actionIcon,this.isBorderLeading=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        actionIcon==null?const SizedBox(): Padding(
            padding: EdgeInsets.only(right: 40),
            child: item(SvgPicture.asset('assets/icons/ic_fillter.svg'), 16)),
      ],

      title: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: titleIcon,
      ),

      centerTitle: false,
    );
  }

  Widget item(Widget? icon, double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE8E6EA), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: icon ?? const SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
