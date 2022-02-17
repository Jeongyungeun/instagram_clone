import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';
import 'package:instagram_clone/constant/screen_size.dart';

class TakePicture extends StatelessWidget {
  const TakePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size!.width,
          height: size!.width,
          color: Colors.black,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: OutlinedButton(
              onPressed: () {},
              child: Container(),
              style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.grey,
                  side: BorderSide(color: Colors.grey, width: 30)),
            ),
          ),
        ),
      ],
    );
  }
}

// 처음 만든 layout
class CameraButton extends StatelessWidget {
  const CameraButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.black,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: common_gap * 3),
        decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(width: 20, color: Colors.black12))),
      ),
    );
  }
}
