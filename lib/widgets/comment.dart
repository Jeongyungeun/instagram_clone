import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

import '../constant/common_size.dart';

class Comment extends StatelessWidget {

  final bool showImage;
  final String userName;
  final String text;
  DateTime? dateTime;

  Comment({
    Key? key, this.showImage = true, required this.userName, required this.text,  this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(showImage)
        RoundedAvatar(
          size: 22,
        ),
        if(showImage)
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
                    text: userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: text,
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            Text(
              dateTime != null ? dateTime!.toIso8601String(): DateTime.now().toString(),
              style: TextStyle(color: Colors.grey[400], fontSize: 10.0),
            )
          ],
        ),
      ],
    );
  }
}
