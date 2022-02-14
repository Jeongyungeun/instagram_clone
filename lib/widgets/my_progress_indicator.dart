import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  const MyProgressIndicator(
      {Key? key, required this.containerSize, this.progressSize=60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      child: Center(
        child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/image/loading_img.gif')),
      ),
    );
  }
}
/// column/center/sizedBox 순으로 와도 될듯