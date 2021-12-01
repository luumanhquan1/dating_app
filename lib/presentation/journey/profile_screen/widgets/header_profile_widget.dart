import 'dart:developer';

import 'package:dating_app/presentation/journey/widgets/base_button_rectan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderProfileWidget extends StatelessWidget {
  final String urlImg;
  final Function onClose;
  final Function onTym;
  final Function onMess;
  const HeaderProfileWidget(
      {Key? key,
      required this.urlImg,
      required this.onClose,
      required this.onMess,
      required this.onTym})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(urlImg), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: BaseButtonRectan(
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: Color(0xffFFFFFF).withOpacity(0.2),
            icon: SvgPicture.asset(
              'assets/icons/ic_back.svg',
              color: Color(0xffFFFFFF),
            ),
          ),
        )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      onClose();
                    },
                    child: Container(
                      padding: EdgeInsets.all(31.5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.07),
                                offset: Offset(0, 20),
                                blurRadius: 50)
                          ]),
                      child: SvgPicture.asset('assets/icons/ic_close.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTym();
                    },
                    child: Container(
                      padding: EdgeInsets.all(28.25),
                      decoration: BoxDecoration(
                          color: Color(0xffE94057),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.07),
                                offset: Offset(0, 15),
                                blurRadius: 15)
                          ]),
                      child: SvgPicture.asset(
                        'assets/icons/ic_tym.svg',
                        height: 42.5,
                        width: 36.47,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onMess();
                    },
                    child: Container(
                      height: 78,
                      width: 78,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.07),
                                offset: Offset(0, 20),
                                blurRadius: 50)
                          ]),
                      child: SvgPicture.asset('assets/icons/ic_start.svg'),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
