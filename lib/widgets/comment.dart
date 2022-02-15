import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedAvatar(
          size: 22,
        ),

        SizedBox(
          width: common_gap,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'userName111',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'I love 정시원!!!',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            Text(
              'timeStamp',
              style: TextStyle(color: Colors.grey[400], fontSize: 10.0),
            )
          ],
        ),
      ],
    );
  }
}
