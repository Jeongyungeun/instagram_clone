import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/pofile_body.dart';

import '../constant/screen_size.dart';
import '../widgets/profile_side_menu.dart';

const Duration duration = Duration(milliseconds: 1000);

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MenuStatus _menuStatus = MenuStatus.closed;
  double boxXpos = 0;
  double menuXpos = size!.width;
  final menuWidth = size!.width/3*2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
                duration: duration,
                child: ProfileBody(
                  onMenuChanged: () {
                    _menuStatus = (_menuStatus == MenuStatus.closed)
                        ? MenuStatus.opened
                        : MenuStatus.closed;
                    switch(_menuStatus){

                      case MenuStatus.opened:
                        boxXpos = -menuWidth;
                        menuXpos = size!.width - menuWidth;
                        break;
                      case MenuStatus.closed:
                        boxXpos =0 ;
                        menuXpos = size!.width;
                        break;
                    }
                    setState(() {});
                  },
                ),transform: Matrix4.translationValues(boxXpos, 0, 0),
            ),
            AnimatedContainer(
              duration: duration,
              child: ProfileSideMenu(menuWidth),
              transform: Matrix4.translationValues(menuXpos, 0, 0),
            ),
          ],
        ),
    );
  }
}

enum MenuStatus { opened, closed }
