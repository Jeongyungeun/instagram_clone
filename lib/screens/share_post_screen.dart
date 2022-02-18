import 'dart:io';
import 'package:flutter/material.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen({Key? key, required this.imageFile}) : super(key: key);

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Image.file(imageFile);
  }
}
