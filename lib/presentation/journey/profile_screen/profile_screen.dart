import 'dart:developer';

import 'package:dating_app/presentation/journey/profile_screen/widgets/header_profile_widget.dart';
import 'package:dating_app/presentation/journey/widgets/base_button_rectan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dating_app/common/extension/string_extensin.dart';

class ProfileScreen extends StatefulWidget {
  final String id;
  const ProfileScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('${widget.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfileWidget(
              urlImg:
                  'https://danviet.mediacdn.vn/upload/1-2017/images/2017-01-21/148498866074167-11-thuy-vi-5.jpg',
              onClose: () {},
              onTym: () {},
              onMess: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jessica Parker, 23',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: Color(0xff000000)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Proffesional model',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Color(0xff000000)),
                            )
                          ],
                        ),
                        BaseButtonRectan(
                          onTap: () {},
                          icon:
                              SvgPicture.asset('assets/icons/ic_send_mess.svg'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
