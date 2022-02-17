import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _currentIndex = index;
          setState(() {});
        },
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.greenAccent,
          ),
          Container(
            color: Colors.deepPurpleAccent,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_rounded), label: 'Gallery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_rounded), label: 'Photo'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Video'),
        ],
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }

  void _onItemTap(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
          _currentIndex, duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn);
    });
  }
}
