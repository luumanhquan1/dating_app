import 'dart:developer';
import 'dart:ui';

import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/presentation/journey/home_screen/Widgets/custom_img_widget.dart';
import 'package:dating_app/presentation/journey/home_screen/view_model/home_screen_view_model.dart';
import 'package:dating_app/presentation/journey/widgets/app_bar/default_app_bar_widget.dart';
import 'package:dating_app/presentation/journey/widgets/tinder_widget.dart/tinder_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blur/blur.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  HomeViewModel viewModel = HomeViewModel();
  CardController controller = CardController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getListUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBarWidget(
        title: 'Discover',
        actionIcon: SvgPicture.asset('assets/icons/ic_fillter.svg'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<UserModel>>(
                stream: viewModel.getListUserBloc,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? [];
                  if (snapshot.hasData) {
                    return TinderSwapCard(
                      swipeCompleteCallback: (origin, index) {
                        log('${index}');
                      },
                      swipeUpdateCallback: (a, w) {
                        log('${a}');
                      },
                      orientation: AmassOrientation.TOP,
                      stackNum: 2,
                      totalNum: data.length,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height * 0.70,
                      minWidth: MediaQuery.of(context).size.width * 0.60,
                      minHeight: MediaQuery.of(context).size.height * 0.4,
                      cardBuilder: (context, index) {
                        final userInfor = data[index];
                        final List<ListImg> listImg = data[index].listImg;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height,
                                  child: ListImgWidget(listImg: listImg),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Stack(
                                      children: [
                                        Blur(
                                          blur: 15,
                                          blurColor: Colors.transparent,
                                          colorOpacity: 0,
                                          child: Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                backgroundBlendMode:
                                                    BlendMode.softLight),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                             const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${userInfor.hoTen}, ${userInfor.age}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    ?.copyWith(
                                                        color: Color(0xffFFFFFF)),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                '${userInfor.msv}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(
                                                        color: Color(0xffFFFFFF)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      cardController: controller,
                    );
                  }
                  return SizedBox();
                }),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
