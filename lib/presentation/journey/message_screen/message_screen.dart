import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/presentation/journey/message_screen/widgets/item_message_widget.dart';
import 'package:dating_app/presentation/journey/message_screen/widgets/story_message_widget.dart';
import 'package:dating_app/presentation/journey/widgets/app_bar/app_bar_title_widget.dart';

import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/show_bottom_mess_widget.dart';
import 'package:dating_app/presentation/journey/widgets/text_form_field_widget.dart';
import 'package:dating_app/presentation/journey/widgets/title_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:socket_io_client/socket_io_client.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Socket socket;
  @override
  void initState() {
    SocketClient().connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBarTitleWidget(
        titleIcon: Text(
          "Messages",
          style: Theme.of(context).textTheme.headline1,
        ),
        actionIcon: SvgPicture.asset('assets/icons/ic_fillter.svg'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: TextFormFieldWidget(),
            ),
            SizedBox(
              height: 10,
            ),
            TitleChildWidget(
                paddingTitle: EdgeInsets.only(left: 44),
                sizeTextTitle: 18,
                title: 'Activities',
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: StoryMessageWidget(),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: TitleChildWidget(
                  sizeTextTitle: 18,
                  title: 'Messages',
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            showBottomMessWidget(context);

                          },
                          child: ItemMessageWidget());
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
