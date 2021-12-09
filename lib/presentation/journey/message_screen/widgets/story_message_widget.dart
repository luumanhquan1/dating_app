import 'package:dating_app/presentation/journey/widgets/liner_boder_widget.dart';
import 'package:flutter/material.dart';
class StoryMessageWidget extends StatelessWidget {
  const StoryMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
              EdgeInsets.only(right: 15, left: index == 0 ? 44 : 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 66,
                    width: 66,
                    child: LinerBorderWidget(
                        strokeWidth: 2,
                        radius: 66,
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
                          decoration:
                          BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQswljkFxMHaUMZK8yk4UVtLPdRj08grsx8Gtuqn63pnVJib-hMAMmjJdX_0JkYP317uww&usqp=CAU',
                            fit: BoxFit.cover,
                          ),
                        ),
                        onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Emma',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            );
          }),
    );
  }
}
