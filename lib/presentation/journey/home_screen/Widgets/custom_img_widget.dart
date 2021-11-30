import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:flutter/material.dart';

class ListImgWidget extends StatefulWidget {
  final List<ListImg> listImg;
  const ListImgWidget({Key? key, required this.listImg}) : super(key: key);

  @override
  _ListImgWidgetState createState() => _ListImgWidgetState();
}

class _ListImgWidgetState extends State<ListImgWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(

        scrollDirection: Axis.vertical,
        itemCount: widget.listImg.length,
        itemBuilder: (context, index) {
          final data = widget.listImg[index];
          return Container(
            child: CachedNetworkImage(
              imageUrl: data.url??'',
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
