import 'package:dating_app/common/constance/layout_constance.dart';
import 'package:dating_app/presentation/journey/onboarding_page/otp_screen/widgets/input_otp_widget.dart';
import 'package:dating_app/presentation/journey/onboarding_page/otp_screen/widgets/key_broad_widget.dart';
import 'package:dating_app/presentation/journey/onboarding_page/otp_screen/widgets/timer_widget.dart';
import 'package:dating_app/presentation/journey/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 40.w,top: 10.h),
                child: IconButtonWidget(
                    size: 52.h,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).buttonColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: LayOutConstance.layOutPaddingHoz),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  TimerWidget(),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: 215.w,
                    child: Text(
                      'Type the verification code we’ve sent you',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 18.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  InputOtpWidget()
                ],
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            KeyBroadWidget(),
            SizedBox(
              height: 53.h,
            ),
            Center(
              child: Text(
                'Send again',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
