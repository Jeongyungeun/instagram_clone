import 'dart:typed_data';
import 'package:instagram_clone/constant/logger.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/gallery_state.dart';
import 'package:instagram_clone/screens/share_post_screen.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:local_image_provider/local_image.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({Key? key}) : super(key: key);

  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, GalleryState galleryState, Widget? child) {
        return GridView.count(
            crossAxisCount: 3, children: getImage(galleryState));
      },
    );
  }

  List<Widget> getImage(GalleryState galleryState) {
    var images = galleryState.images
        .map(
          (localImage) => InkWell(
            onTap: () async {
              try {
                final ImagePicker _picker = ImagePicker();
                final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery);
                if(image !=null)
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SharePostScreen(imageXfile: image),),);
              }catch(e){
                logger.e(e);
              }
            },
            child: Image(
              image: DeviceImage(localImage),
            ),
          ),
        )
        .toList();
    return images;
  }

  Future<Uint8List> localImageToBytes(
      GalleryState galleryState, LocalImage localImage) {
    return localImage.getScaledImageBytes(galleryState.localImageProvider, 0.3);
  }
}
