import 'package:dating_app/presentation/journey/widgets/tinder_widget.dart/tinder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSetTrangThaiWidget extends StatefulWidget {
  final bool isClose;
  const IconSetTrangThaiWidget({Key? key,required this.isClose}) : super(key: key);

  @override
  _IconSetTrangThaiWidgetState createState() => _IconSetTrangThaiWidgetState();
}

class _IconSetTrangThaiWidgetState extends State<IconSetTrangThaiWidget> {
  late Alignment alignment = Alignment(0, 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.07),
                  offset: const Offset(0, 20),
                  blurRadius: 20)
            ]),
        child:widget.isClose?SvgPicture.asset('assets/icons/ic_close.svg'): SvgPicture.asset(
          'assets/icons/ic_tym.svg',
          color: Colors.red,
          height: 29,
          width: 34,
        ),
      ),
    );
  }
}
