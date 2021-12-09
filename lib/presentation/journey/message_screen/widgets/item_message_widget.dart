import 'dart:developer';

import 'package:dating_app/presentation/journey/widgets/liner_boder_widget.dart';
import 'package:flutter/material.dart';

class ItemMessageWidget extends StatelessWidget {
  const ItemMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(onTap: (){
            log('111');
          },
            child: SizedBox(
              height: 56,
              width: 56,
              child: LinerBorderWidget(
                  strokeWidth: 2,
                  radius: 56,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffF27121),
                      Color(0xffE94057),
                      Color(0xff8A2387)
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQswljkFxMHaUMZK8yk4UVtLPdRj08grsx8Gtuqn63pnVJib-hMAMmjJdX_0JkYP317uww&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onPressed: () {}),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffE8E6EA)))),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emelie",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Ok, see you then',
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('23 min'),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Color(0xffE94057), shape: BoxShape.circle),
                          child: Text(
                            '1',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(fontSize: 12),
                          ),
                        )
                      ],
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
}
