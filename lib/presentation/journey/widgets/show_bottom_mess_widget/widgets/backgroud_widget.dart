import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  child: SvgPicture.asset(
                    'assets/icons/ic_show_bottom.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset('assets/icons/ic_indicator.svg')),
            ],
          ),
          child
        ],
      ),
    );
  }
}
