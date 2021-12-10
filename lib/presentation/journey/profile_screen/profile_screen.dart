import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/presentation/journey/home_screen/view_model/home_screen_view_model.dart';
import 'package:dating_app/presentation/journey/profile_screen/profile_viewmodel.dart';
import 'package:dating_app/presentation/journey/profile_screen/widgets/gallery_widget.dart';
import 'package:dating_app/presentation/journey/profile_screen/widgets/header_profile_widget.dart';
import 'package:dating_app/presentation/journey/profile_screen/widgets/interests_widget.dart';
import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/show_bottom_mess_widget.dart';
import 'package:dating_app/presentation/journey/widgets/title_child_widget.dart';
import 'package:dating_app/presentation/journey/widgets/base_button_rectan.dart';
import 'package:dating_app/presentation/journey/widgets/read_more_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfileScreen extends StatefulWidget {
  final String id;
  final String urlImg;
  const ProfileScreen({Key? key, required this.id, required this.urlImg})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewModel viewModel = ProfileViewModel();
  final SocketClient socketClient=getIt<SocketClient>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProfile(widget.id);
    socketClient.on('getMess', (data) {
      log('${data}');
    });
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
              urlImg: widget.urlImg,
              onClose: () {
                socketClient.emit('message', {'idNguoiNhan':widget.id,'mess':"213123"});
                // Navigator.pop(context,onTrangThai.close);
              },
              onTym: () {
                Navigator.pop(context,onTrangThai.tym);
              },
              onMess: () {
                Navigator.pop(context,onTrangThai.superLike);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: StreamBuilder<UserModel>(
                  stream: viewModel.getUserProfile,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? UserModel.fromJson({});
                    if (snapshot.hasData) {
                      return Column(
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
                                      '${data.hoTen}, ${data.age}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(color: Color(0xff000000)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${data.msv}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(color: Color(0xff000000)),
                                    )
                                  ],
                                ),
                                BaseButtonRectan(
                                  onTap: () {
                                    showBottomMessWidget(context,idNguoiNhan: data.id);
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/icons/ic_send_mess.svg'),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TitleChildWidget(
                              title: 'About',
                              child: ReadMoreWidget(
                                lengthText: 190,
                                text:
                                    'My name is Jessica Parke31231 21321 2 123 21321 2321 21 12 2132 132321wqe  wqe213e qwe2 ưqe234r and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading iqje ioq eio qou oieu oiqwue ioeq io oiu oiuq oiqj oiu eoiwque ợi iojwq oi',
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          TitleChildWidget(
                              title: 'Interests',
                              child: InterestsWidget(
                                listSoThich: data.listSoThich,
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          TitleChildWidget(
                            title: 'Gallery',
                            child: GalleryWidget(listImg: data.listImg,),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      );
                    }
                    return SizedBox();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
