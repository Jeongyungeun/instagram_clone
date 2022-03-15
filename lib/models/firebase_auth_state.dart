import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/logger.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  User? _user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void watchAuthChange() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null && _user == null) {
        return;
      } else if (user != _user) {
        _user = user;
        changeFirebaseAuthStatus();
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    });
  }

  void registerUser(BuildContext context, {required String email, required String password}) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
          String _message = '';
          switch(error.code){
            case 'email-already-in-use':
              _message = '이메일 이미 존재 함';
              break;
            case 'invalid-email':
              _message = '이메일 이상한데?';
              break;
            case 'operation-not-allowed':
              _message = '이메일 역시 이상해..';
              break;
            case 'weak-password':
              _message = '패스워드 더 넣어줘';
              break;

          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message)));

    });
  }

  void login(BuildContext context, {required String email, required String password}) {
    _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password.trim()).catchError((error) {
      String _message = '';
      switch(error.code){
        case 'invalid-email':
          _message = '이메일 인증안됨';
          break;
        case 'user-disabled':
          _message = '사용자 이용 불가?';
          break;
        case 'user-not-found':
          _message = '사용자 못찾겠음 꾀꼬리..';
          break;
        case 'wrong-password':
          _message = '패스워드 틀려';
          break;
//invalid-email
// user-disabled
// user-not-found
// wrong-password
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message)));

    });
  }

  void signOut() {
    _firebaseAuthStatus = FirebaseAuthStatus.signout;
    if (_user != null) {
      _user = null;
      _firebaseAuth.signOut();
    }
    notifyListeners();
  }

  void changeFirebaseAuthStatus({FirebaseAuthStatus? firebaseAuthStatus}) {
    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_user != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus { signout, progress, signin }
