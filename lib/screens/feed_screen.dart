import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/repo/user_service.dart';
import 'package:instagram_clone/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 12.0),
          //   child: ImageIcon(AssetImage('assets/image/actionbar_camera.png')),
          // ),
          IconButton(onPressed: (){
            userService.sendData();
          }, icon: Icon(Icons.add_outlined)),
          IconButton(onPressed: (){
            userService.getData();
          }, icon: Icon(Icons.circle)),
        ],
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black87,
          ),
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
      body: ListView.builder(
        itemBuilder: feedList,
        itemCount: 30,
      ),
    );
  }

  Widget feedList(BuildContext context, int index) {
    return Post(index: index,);
  }
}


