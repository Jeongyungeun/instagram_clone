import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';

class SharePostScreen extends StatelessWidget {
  SharePostScreen({Key? key, required this.imageXfile}) : super(key: key);

  final XFile imageXfile;


  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: imageXfile.readAsBytes(),
        builder:(BuildContext context, AsyncSnapshot<Uint8List> snapshot){
          if(snapshot != null && snapshot.hasData){
          return ExtendedImage.memory(snapshot.data!);
          }else{
            return MyProgressIndicator(containerSize: 100);
          }
        });
  }
}
