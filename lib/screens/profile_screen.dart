import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/pofile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            ProfileBody()
          ],
        ),
      ),
    );
  }


  Row _appBar() {
    return Row(
      children: [
        SizedBox(
          width: 40,
        ),
        Expanded(
            child: Text(
          '정윤근의 인스타',
          textAlign: TextAlign.center,
        )),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
