import 'package:flutter/material.dart';

class ItemMessagesWidget extends StatelessWidget {
  final String mess;
  const ItemMessagesWidget({Key? key,required this.mess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffE94057).withOpacity(0.07),
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            ),
            child: Text(
                mess),
          ),
        ],
      ),
    );
  }
}
