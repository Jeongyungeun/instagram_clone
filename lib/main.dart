import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/material_color.dart';
import 'constant/screen_size.dart';
import 'home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: white,

      ),
    );
  }
}


