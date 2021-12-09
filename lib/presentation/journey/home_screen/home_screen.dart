import 'dart:developer';
import 'dart:ui';

import 'package:dating_app/common/constance/hero_constance.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/presentation/journey/home_screen/Widgets/custom_img_widget.dart';
import 'package:dating_app/presentation/journey/home_screen/Widgets/infor_user_widget.dart';
import 'package:dating_app/presentation/journey/home_screen/Widgets/page_index_widget.dart';
import 'package:dating_app/presentation/journey/home_screen/view_model/home_screen_view_model.dart';
import 'package:dating_app/presentation/journey/profile_screen/profile_screen.dart';
import 'package:dating_app/presentation/journey/widgets/app_bar/default_app_bar_widget.dart';
import 'package:dating_app/presentation/journey/widgets/tinder_widget.dart/tinder_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
                stream: viewModel.getListUserBloc,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? [];
                  if (snapshot.hasData) {
                    return TinderSwapCard(
                      swipeCompleteCallback: (origin, index) {
                        if(origin==CardSwipeOrientation.RIGHT){
                          viewModel.thaoTacUser(data[index].id,trangThai: onTrangThai.tym);
                        }

                      },
                      swipeUpdateCallback: (a, w) {

                      },
                      orientation: AmassOrientation.TOP,
                      stackNum: 2,
                      totalNum: data.length,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height * 0.78,
                      minWidth: MediaQuery.of(context).size.width * 0.60,
                      minHeight: MediaQuery.of(context).size.height * 0.4,
                      cardBuilder: (context, index) {
                        final userInfor = data[index];
                        final List<ListImg> listImg = data[index].listImg;
                        final PageController pageController = PageController();
                        return GestureDetector(
                          onTap: () async {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => ProfileScreen(
                                          id: userInfor.id,
                                          urlImg:
                                              userInfor.listImg.first.url ?? '',
                                        )),

                            )
                                .then((value) {
                              if (value != null) {
                                onTrangThai trangThai = value;
                                switch(trangThai){
                                  case onTrangThai.close:
                                    controller.triggerLeft();
                                    break;
                                  case onTrangThai.tym:
                                    controller.triggerRight();
                                    break;
                                  case onTrangThai.superLike:
                                    controller.triggerUp();
                                }
                              }
                            });
                          },
                          child: Container(
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
                                    color: Colors.transparent,
                                    child: ListImgWidget(
                                      listImg: listImg,
                                      controller: pageController,
                                      cardController: controller,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: InfoUserWidget(
                                        userModel: userInfor,
                                      )),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 85),
                                      child: PageIndexWidget(
                                        controller: pageController,
                                        pageIndex: listImg.length,
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
          Hero(
            tag: HeroConstance.keyHeroLikeConstance,
            child: Container(
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.triggerLeft();
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
                      controller.triggerRight();
                    },
                    child: Container(
                      padding: EdgeInsets.all(28.25),
                      decoration: BoxDecoration(
                          color: Color(0xffE94057),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff000000).withOpacity(0.07),
                                offset: Offset(0, 20),
                                blurRadius: 50)
                          ]),
                      child: SvgPicture.asset('assets/icons/ic_tym.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.triggerUp();
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
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
