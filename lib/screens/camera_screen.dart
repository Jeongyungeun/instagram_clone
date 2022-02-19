import 'package:flutter/material.dart';
import 'package:instagram_clone/models/camera_state.dart';
import 'package:instagram_clone/models/gallery_state.dart';
import 'package:instagram_clone/widgets/my_gallery.dart';
import 'package:instagram_clone/widgets/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  CameraState _cameraState = CameraState();
  GalleryState _galleryState = GalleryState();


  CameraScreen({Key? key}) : super(key: key);
  @override
  _CameraScreenState createState() {
    _cameraState.getReadyToTakePhoto();
    _galleryState.initProvider();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  List<String> _title = ['Gallery', 'Photo', 'Video'];

  @override
  void dispose() {
    _pageController.dispose();
    widget._cameraState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>(create: (_)=>widget._cameraState),
        ChangeNotifierProvider<GalleryState>(create: (_)=>widget._galleryState)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title[_currentIndex]),
          centerTitle: true,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            _currentIndex = index;
            setState(() {});
          },
          children: [
            MyGallery(),
            TakePicture(),
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
