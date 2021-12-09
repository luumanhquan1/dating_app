import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? actionIcon;
  final String title;
  final bool isBorderLeading;
  const DefaultAppBarWidget(
      {Key? key, this.leadingIcon, this.title = '', this.actionIcon,this.isBorderLeading=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 40),
            child:
                leadingIcon == null ? const SizedBox() :isBorderLeading?item(leadingIcon, 19):leadingIcon),
      ),
      actions: [
       actionIcon==null?const SizedBox(): Padding(
            padding: EdgeInsets.only(right: 40),
            child: item(SvgPicture.asset('assets/icons/ic_fillter.svg'), 16)),
      ],
      leadingWidth: 100,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Color(0xff000000), fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
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
