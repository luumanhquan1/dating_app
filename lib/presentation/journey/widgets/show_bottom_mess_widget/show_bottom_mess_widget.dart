import 'dart:developer';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/widgets/backgroud_widget.dart';
import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/widgets/item_message_widget.dart';
import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/widgets/title_widget.dart';
import 'package:dating_app/presentation/journey/widgets/text_form_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base_button_rectan.dart';

void showBottomMessWidget(BuildContext context, {String idNguoiNhan = ''}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Scaffold(
          backgroundColor: Colors.transparent,
          body: MessagesWidget(
            idNguoiNhan: idNguoiNhan,
          )),
      enableDrag: true,
      isDismissible: true);
}

class MessagesWidget extends StatefulWidget {
  final String idNguoiNhan;
  const MessagesWidget({Key? key, required this.idNguoiNhan}) : super(key: key);

  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  final socket = getIt<SocketClient>();
  final TextEditingController controller = TextEditingController();
  List<String> a = [
    '2342342',
    '214234324',
    '3242342412',
    '13131313122134859317582317581',
    '134805813904580913850931850',
    '134580918405831094859013850913'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket.on('getMess', (data) {
      a.add(data);
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 45, right: 40, left: 40),
          child: Column(
            children: [
              TitleWidget(),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView(
                    reverse: true,
                    children: List.generate(
                        a.length,
                        (index) => Align(
                            alignment: index % 2 == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: ItemMessagesWidget(
                              mess: a[index],
                            )))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Row(
              children: [
                Expanded(
                    child: TextFormFieldWidget(
                  controller: controller,
                )),
                BaseButtonRectan(
                  onTap: () {
                    socket.emit('message', {
                      'idNguoiNhan': widget.idNguoiNhan,
                      'mess': controller.text
                    });
                  },
                  icon: SvgPicture.asset('assets/icons/ic_send_mess.svg'),
                )
              ],
            )),
      ),
    );
  }
}
