import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:dating_app/presentation/journey/home_screen/Widgets/icon_set_trang_thai_widget.dart';
import 'package:dating_app/presentation/journey/widgets/tinder_widget.dart/tinder_widget.dart';
import 'package:flutter/material.dart';

const NEXT_PAGE_DX_LEFT = -200;
const NEXT_PAGE_DX_RIGHT = 200;
const CLOSE_OFFSET_LEFT = -3.1;
const CLOSE_OFFSET_RIGHT = 3.1;

class ListImgWidget extends StatefulWidget {
  final List<ListImg> listImg;
  final PageController controller;
  final CardController cardController;

  const ListImgWidget(
      {Key? key,
      required this.listImg,
      required this.controller,
      required this.cardController})
      : super(key: key);

  @override
  _ListImgWidgetState createState() => _ListImgWidgetState();
}

class _ListImgWidgetState extends State<ListImgWidget> {
  late Alignment alignment = Alignment(0, 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cardController.addListen((value) {
      if (value.x < NEXT_PAGE_DX_LEFT || value.x > NEXT_PAGE_DX_RIGHT) {
        if (widget.controller.page != 0) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            widget.controller.jumpToPage(0);
          });
        }
      }
      alignment = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: PageView.builder(
              controller: widget.controller,
              scrollDirection: Axis.vertical,
              itemCount: widget.listImg.length,
              itemBuilder: (context, index) {
                final data = widget.listImg[index];
                return Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(image: AssetImage('assets/imgs/photo.png'),fit: BoxFit.cover)
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: data.url??'',
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                );
              }),
        ),
        Visibility(
            visible: alignment.x < CLOSE_OFFSET_LEFT ||
                alignment.x > CLOSE_OFFSET_RIGHT,
            child: IconSetTrangThaiWidget(isClose: alignment.x < CLOSE_OFFSET_LEFT,))
      ],
    );
  }
}
