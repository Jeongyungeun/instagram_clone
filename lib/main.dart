import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/material_color.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:instagram_clone/screens/auth_screen.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'constant/screen_size.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();
  Widget? _currentWidget;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        home: Consumer(
            builder: (BuildContext context, FirebaseAuthState firebaseAuthState,
                Widget? child) {
              switch (firebaseAuthState.firebaseAuthStatus) {
                case FirebaseAuthStatus.signout:
                  _currentWidget = AuthScreen();
                  break;
                case FirebaseAuthStatus.progress:
                  _currentWidget = MyProgressIndicator(containerSize: 100);
                  break;
                case FirebaseAuthStatus.signin:
                  _currentWidget = HomePage();
                  break;
              }
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 2000),
                child: _currentWidget,
              );
            },
            child: HomePage()),
        // home: HomePage(),
        theme: ThemeData(
          primarySwatch: white,
        ),
      ),
    );
  }
}
