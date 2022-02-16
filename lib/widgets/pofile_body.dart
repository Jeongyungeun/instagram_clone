import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/screen_size.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

import '../constant/common_size.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key, required this.onMenuChanged}) : super(key: key);

  final Function onMenuChanged;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;

  // 위에 값을 밑에 _selectedTab 으로 대체
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size!.width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(common_gap),
                            child: RoundedAvatar(size: 80),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: common_gap),
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      _valueText('123456'),
                                      _valueText('1245'),
                                      _valueText('124556'),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _labelText('post'),
                                      _labelText('follower'),
                                      _labelText('follower'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      _userName(),
                      _userBio(),
                      _editProfileButton(),
                      _tapButtons(),
                      _selectedIndicator(),
                    ],
                  ),
                ),
                _imagesPager(),
              ],
            ),
          )
        ],
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
          onPressed: () {widget.onMenuChanged();},
          icon: Icon(Icons.menu),
        )
      ],
    );
  }

  Text _valueText(String txt) => Text(
        txt,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
  Text _labelText(String txt) => Text(
        txt,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11,),
        textAlign: TextAlign.center,
      );

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          ),
        ],
      ),
    );
  }

  GridView _images() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 1,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        30,
        (index) => CachedNetworkImage(
          imageUrl: 'http://picsum.photos/id/$index/100/100',
          fit: BoxFit.cover,
        ),
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
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
    );
  }

  Row _tapButtons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              _tabSelected(SelectedTab.left);
            },
            icon: ImageIcon(
              AssetImage('assets/image/grid.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              _tabSelected(SelectedTab.right);
            },
            icon: ImageIcon(
              AssetImage('assets/image/saved.png'),
              color: _selectedTab == SelectedTab.right
                  ? Colors.black26
                  : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagesPageMargin = 0;
          _rightImagesPageMargin = size!.width;
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagesPageMargin = -size!.width;
          _rightImagesPageMargin = 0;
          break;
      }
    });
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

enum SelectedTab { left, right }
