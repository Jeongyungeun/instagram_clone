import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

import 'constant/screen_size.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BottomNavigationBarItem> btmNavItems =[
    BottomNavigationBarItem(icon: Icon(Icons.home), label : 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label : 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label : 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label : 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label : 'home'),
  ];

  int _selectedIndex = 0;

  List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.redAccent,),
    Container(color: Colors.blue,),
    Container(color: Colors.purple,),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...btmNavItems,
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemClick,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _onBtmItemClick(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
