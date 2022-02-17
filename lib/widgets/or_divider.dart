import 'package:flutter/material.dart';

class orDecoration extends StatelessWidget {
  const orDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.grey[300],
          height: 1,
        ),
        Container(
          color: Colors.grey[50],
          height: 3,
          width: 60,
        ),
        Text(
          'OR',
          style: TextStyle(color: Colors.grey[500]),
        )
      ],
    );
  }
}