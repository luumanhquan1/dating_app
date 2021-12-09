import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:flutter/material.dart';

const HEIGHT_IMG = 190.0;
const HEIGHT_IMG_NHO = 122.0;

class GalleryWidget extends StatelessWidget {
  final List<ListImg> listImg;
  const GalleryWidget({Key? key, required this.listImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: imgWidget(
                      height: HEIGHT_IMG,
                      url: listImg.isEmpty ? '' : listImg[0].url ?? '')),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: imgWidget(
                      height: HEIGHT_IMG,
                      url: listImg.length > 1 ? listImg[1].url ?? '' : ''))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: imgWidget(
                      height: HEIGHT_IMG_NHO,
                      url: listImg.length > 2 ? listImg[2].url ?? '' : '')),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: imgWidget(
                      height: HEIGHT_IMG_NHO,
                      url: listImg.length > 3 ? listImg[3].url ?? '' : '')),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: imgWidget(
                      height: HEIGHT_IMG_NHO,
                      url: listImg.length > 4 ? listImg[4].url ?? '' : ''))
            ],
          )
        ],
      ),
    );
  }

  Widget imgWidget({double height = 0, String url = ''}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover,),
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
