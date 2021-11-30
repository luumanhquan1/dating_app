import 'package:dating_app/common/constance/boder_constance.dart';
import 'package:dating_app/common/utils/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFiledWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextFormFiledWidget({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.subtitle1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(18.w),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                borderSide:
                    BorderSide(color: Colors.black.withOpacity(0.2), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                borderSide:
                    BorderSide(color: Colors.black.withOpacity(0.2), width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                borderSide:
                    BorderSide(color: Theme.of(context).buttonColor, width: 1)),
            labelText: "number phone",
            labelStyle: Theme.of(context).textTheme.subtitle1),
        validator: (value) {
          if (value!.isEmpty) {
            return "This field cannot be empty";
          }
          return null;
        },
      ),
    );
  }
}
