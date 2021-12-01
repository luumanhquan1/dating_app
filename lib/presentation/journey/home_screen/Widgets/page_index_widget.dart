

import 'package:flutter/material.dart';

class PageIndexWidget extends StatefulWidget {
  final PageController controller;
  final int pageIndex;
  const PageIndexWidget({Key? key, required this.controller,required this.pageIndex}) : super(key: key);

  @override
  _PageIndexWidgetState createState() => _PageIndexWidgetState();
}

class _PageIndexWidgetState extends State<PageIndexWidget> {
  double index = 0.0;
  @override
  void didUpdateWidget(covariant PageIndexWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    widget.controller.addListener(() {
      index = widget.controller.page ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 20,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF).withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            widget.pageIndex,
            (index) => Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                      color: index == this.index
                          ? Colors.white
                          : Color(0xffFFFFFF).withOpacity(0.5),
                      shape: BoxShape.circle),
                )),
      ),
    );
  }
}
