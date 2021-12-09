import 'dart:developer';

import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/widgets/backgroud_widget.dart';
import 'package:dating_app/presentation/journey/widgets/show_bottom_mess_widget/widgets/title_widget.dart';
import 'package:dating_app/presentation/journey/widgets/text_form_field_widget.dart';
import 'package:dating_app/presentation/journey/widgets/text_form_flied_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base_button_rectan.dart';
import '../liner_boder_widget.dart';

void showBottomMessWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => MessagesWidget(),
    enableDrag: true,
  );
}

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({Key? key}) : super(key: key);

  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child:  Padding(
        padding: const EdgeInsets.only(top: 45, right: 40, left: 40),
        child: Column(
          children: [
            TitleWidget(),
            Expanded(
              child: ListView(
                  children:List.generate(100, (index) => Text('123'))
              ),
            ),
            TextFormFieldWidget()
          ],
        ),
      )
    );
  }
}
