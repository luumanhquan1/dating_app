import 'package:blur/blur.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:flutter/material.dart';
class InfoUserWidget extends StatelessWidget {
  final UserModel userModel;
  const InfoUserWidget({Key? key,required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Blur(
          blur: 10,
          blurColor: Colors.transparent,
          colorOpacity: 0,
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Text(
                  '${userModel.hoTen}, ${userModel.age}',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(
                      color:
                      Color(0xffFFFFFF)),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '${userModel.msv}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                    color:
                    Color(0xffFFFFFF)),
              )
            ],
          ),
        )
      ],
    );
  }
}
