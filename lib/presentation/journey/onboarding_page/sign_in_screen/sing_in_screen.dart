import 'package:dating_app/common/constance/layout_constance.dart';
import 'package:dating_app/presentation/journey/widgets/button_widget.dart';
import 'package:dating_app/presentation/journey/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 128.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 133.w),
              height: 100.h,
              width: 108.64.w,
              child: Image.asset('assets/icons/logo.png'),
            ),
            SizedBox(
              height: 78.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: LayOutConstance.layOutPaddingHoz),
              child: Column(
                children: [
                  Container(
                    height: 27.h,
                    width: 295.w,
                    alignment: Alignment.center,
                    child: Text(
                      'Sign up to continue',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  ButtonWidget(buttonTxt: 'Continue with email', onTap: () {}),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    buttonTxt: 'Use phone number',
                    onTap: () {},
                    isButtonColor: false,
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  Row(
                    children: [
                      lineWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Text(
                          'or sign up with',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 12.sp),
                        ),
                      ),
                      lineWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtonWidget(
                        icon: Image.asset('assets/icons/fbicon.png'),
                        onTap: () {},
                      ),
                      IconButtonWidget(
                        icon: Image.asset('assets/icons/google.png'),
                        onTap: () {},
                      ),
                      IconButtonWidget(
                        icon: Image.asset('assets/icons/apple.png'),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget lineWidget() {
    return Container(
        height: 0.5.h,
        width: 94.w,
        color: Theme.of(context).canvasColor.withOpacity(0.4));
  }
}
