import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(CupertinoIcons.camera, color: Colors.black87,
          )
        ),
        centerTitle: true,
        title: Text(
          'instagram',
          style: TextStyle(
            fontFamily: 'VeganStyle',
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: feedList,
        itemCount: 30,
      ),
    );
  }
  Widget feedList(BuildContext context, int index){
    return Container(
      color: Colors.accents[index %  Colors.accents.length],
      height: 100,
    );
  }
}
