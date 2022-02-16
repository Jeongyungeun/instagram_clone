import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/screen_size.dart';

import '../constant/common_size.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;
  SelectedTab _selectedTab = SelectedTab.left;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _userName(),
                _userBio(),
                _editProfileButton(),
                _tapButtons(),
                _selectedIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      child: Container(
        height: 3,
        width: size!.width / 2,
        color: Colors.black87,
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: _selectedTab == SelectedTab.left ? Alignment.centerLeft : Alignment.centerRight,
    );
  }

  Row _tapButtons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              selectedLeft = true;
              setState(() {});
            },
            icon: ImageIcon(
              AssetImage('assets/image/grid.png'),
              color: selectedLeft ? Colors.black : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              selectedLeft = false;
              setState(() {});
            },
            icon: ImageIcon(
              AssetImage('assets/image/saved.png'),
              color: selectedLeft ? Colors.black26 : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: common_gap, vertical: common_gap),
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
}


enum SelectedTab{left, right}