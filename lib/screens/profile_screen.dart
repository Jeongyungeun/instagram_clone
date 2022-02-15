import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';

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
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _userName(),
                      _userBio(),
                      _editProfileButton(),
                    ],),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 30,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: BorderSide(width: 3.0, color: Colors.black87)),
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
    );
  }

  Widget _userName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'userName',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'This is what I believe',
        style: TextStyle(fontWeight: FontWeight.w400),
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
