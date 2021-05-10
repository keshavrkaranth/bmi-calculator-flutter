import 'package:flutter/material.dart';

class customWidget extends StatelessWidget {
  customWidget({@required this.name, this.icn});

  final String name;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icn,
          size: 70,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}
