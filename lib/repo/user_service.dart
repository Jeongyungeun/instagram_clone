import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Future<void> sendData() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc('123123')
        .set({'email': 'testing@gmail.com', 'username': '정윤근'});
  }

  void getData() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc('123123')
        .get()
        .then((value) => print(value.data()));
  }
}

UserService userService = UserService();