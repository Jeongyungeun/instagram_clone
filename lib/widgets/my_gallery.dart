import 'package:flutter/material.dart';
import 'package:instagram_clone/models/gallery_state.dart';
import 'package:local_image_provider/device_image.dart';
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
          (localImage) => Image(
            image: DeviceImage(localImage),
          ),
        )
        .toList();
    return images;
  }
}
