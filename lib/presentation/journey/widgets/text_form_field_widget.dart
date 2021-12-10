import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  const TextFormFieldWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(color: Color(0xff000000).withOpacity(0.4)),
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xffE8E6EA), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xffE8E6EA), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder:  OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xffE8E6EA), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(
                'assets/icons/ic_search.svg',
                width: 20,
                height: 20,
              ))),
    );
  }
}
