import 'package:flutter/material.dart';

class TitleChildWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final double sizeTextTitle;
  final EdgeInsetsGeometry paddingTitle;
  const TitleChildWidget(
      {Key? key,
      required this.child,
      required this.title,
      this.sizeTextTitle = 16,
      this.paddingTitle = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: paddingTitle,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Color(0xff000000), fontSize: sizeTextTitle),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        child
      ],
    );
  }
}
