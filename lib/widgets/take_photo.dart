import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';
import 'package:instagram_clone/constant/screen_size.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';



class TakePicture extends StatefulWidget {
  const TakePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {

  late final CameraController _cameraController;
  Widget _progress = MyProgressIndicator(containerSize: 100);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: size!.width,
              height: size!.width,
              color: Colors.black,
              child: snapshot.hasData?_getPreview(snapshot.data as List<CameraDescription> ):_progress,
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
    );
  }

  Widget _getPreview(List<CameraDescription> cameras){
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    return FutureBuilder(
      future: _cameraController.initialize(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done)
        return CameraPreview(_cameraController);
        else{
          return _progress;
        }
      }
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
