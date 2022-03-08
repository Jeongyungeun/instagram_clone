import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthState extends ChangeNotifier{
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  User? _user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  void watchAuthChange(){
    _firebaseAuth.authStateChanges().listen((user) {
      if(user == null && _user == null){
        return;
      }else if(user != _user){
      _user = user;
      changeFirebaseAuthStatus();
      }else{
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    });
  }

  void signOut(){
  _firebaseAuthStatus = FirebaseAuthStatus.signout;
  if(_user != null){
    _user = null;
    _firebaseAuth.signOut();
  }
  notifyListeners();
  }

  void changeFirebaseAuthStatus({FirebaseAuthStatus? firebaseAuthStatus}){
    if(firebaseAuthStatus != null){
      _firebaseAuthStatus = firebaseAuthStatus;
    }else{
      if(_user != null){
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      }else{
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    notifyListeners();
  }


 FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}
enum FirebaseAuthStatus{
  signout, progress, signin
}