import 'dart:developer';

import 'package:flutter/material.dart';
class ReadMoreWidget extends StatefulWidget {
  final String text;
  final int lengthText;
  const ReadMoreWidget({Key? key,required this.text,this.lengthText=150}) : super(key: key);

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> with SingleTickerProviderStateMixin{
  final GlobalKey key=GlobalKey();
  bool isReadMore = false;
  String readMore = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > widget.lengthText ) {
      readMore = widget.text.substring(0, widget.lengthText) + "...";
      isReadMore = true;
    }

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isReadMore = !isReadMore;

        setState(() {});
      },
      child: RichText(
        text: TextSpan(
          text: isReadMore ? readMore : widget.text,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Color(0xff000000).withOpacity(0.7),
          ),
          children: <TextSpan>[
            TextSpan(
                text: isReadMore ? 'Read more' : '',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.red, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
