import 'dart:developer';

import 'package:dating_app/common/constance/layout_constance.dart';
import 'package:dating_app/common/constance/route_constance.dart';
import 'package:dating_app/presentation/journey/widgets/button_widget.dart';
import 'package:dating_app/presentation/journey/widgets/text_form_flied_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMobileScreen extends StatefulWidget {
  const MyMobileScreen({Key? key}) : super(key: key);

  @override
  _MyMobileScreenState createState() => _MyMobileScreenState();
}

class _MyMobileScreenState extends State<MyMobileScreen> {
  TextEditingController _numberPhoneController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: LayOutConstance.layOutPaddingHoz),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 128.h,
              ),
              Text(
                'My mobile',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Please enter your valid phone number. We will send you a 4-digit code to verify your account.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 32.h,
              ),
              Form(
                  key: _globalKey,
                  child: TextFormFiledWidget(
                    controller: _numberPhoneController,
                  )),
              SizedBox(
                height: 64.h,
              ),
              ButtonWidget(buttonTxt: 'Continue', onTap: _setButtonOnClick)
            ],
          ),
        ),
      ),
    );
  }

  _setButtonOnClick() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_globalKey.currentState!.validate()) {
      Navigator.pushNamed(context, RouteList.otpScreen);
    }
  }
}
