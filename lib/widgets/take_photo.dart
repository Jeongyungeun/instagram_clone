import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';
import 'package:instagram_clone/constant/screen_size.dart';
import 'package:instagram_clone/models/camera_state.dart';
import 'package:instagram_clone/screens/share_post_screen.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  Widget _progress = MyProgressIndicator(containerSize: 100);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
      builder: (BuildContext context, CameraState cameraState, Widget? child) {
        return Column(
          children: [
            Container(
              width: size!.width,
              height: size!.width * 1.2,
              color: Colors.black,
              child: cameraState.isReadyToTakePhoto
                  ? _getPreview(cameraState)
                  : _progress,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: OutlinedButton(
                  onPressed: () {
                    if (cameraState.isReadyToTakePhoto) {
                      _attempTakePhoto(cameraState, context);
                    }
                  },
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
      },
    );
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            width: size!.width,
            height: size!.width * cameraState.controller.value.aspectRatio,
            child: CameraPreview(cameraState.controller),
          ),
        ),
      ),
    );
  }

  void _attempTakePhoto(CameraState cameraState, BuildContext context) async {
    try {
      XFile pictureTaken = await cameraState.controller.takePicture();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SharePostScreen(imageXfile: pictureTaken)));
    } catch (e) {}
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
