import 'dart:developer';

import 'package:dating_app/presentation/journey/widgets/base_button_rectan.dart';
import 'package:dating_app/presentation/journey/widgets/liner_boder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            log('111');
          },
          child: SizedBox(
            height: 48,
            width: 48,
            child: LinerBorderWidget(
                strokeWidth: 2,
                radius: 56,
                gradient: LinearGradient(
                  colors: [
                    Color(0xffF27121),
                    Color(0xffE94057),
                    Color(0xff8A2387)
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.all(4),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQswljkFxMHaUMZK8yk4UVtLPdRj08grsx8Gtuqn63pnVJib-hMAMmjJdX_0JkYP317uww&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
                onPressed: () {}),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grace',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Color(0xff000000)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Online',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontSize: 12,
                                    color: Color(0xff000000).withOpacity(0.4)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                BaseButtonRectan(
                  onTap: () {},
                  size: 52,
                  icon: SvgPicture.asset('assets/icons/ic_more_one.svg'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
