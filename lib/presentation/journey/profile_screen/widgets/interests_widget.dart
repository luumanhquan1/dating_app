import 'package:dating_app/data/remote_data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InterestsWidget extends StatelessWidget {
  final List<ListSoThich> listSoThich;
  const InterestsWidget({Key? key, required this.listSoThich})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      padding: const EdgeInsets.only(top: 5),
      childAspectRatio: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: List.generate(listSoThich.length, (index) {
        final data = listSoThich[index];
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      data.isSoThich ? Color(0xffE94057) : Color(0xffE8E6EA)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data.isSoThich
                  ? Row(
                      children: [
                        SvgPicture.asset('assets/icons/ic_tick.svg'),
                        const SizedBox(
                          width: 2.68,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Text(
                '${data.name}',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight:
                        data.isSoThich ? FontWeight.w700 : FontWeight.w400,
                    color:
                        data.isSoThich ? Color(0xffE94057) : Color(0xff000000)),
              )
            ],
          ),
        );
      }),
    );
  }
}
