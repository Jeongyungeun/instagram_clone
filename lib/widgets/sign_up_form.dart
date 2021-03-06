import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/auth_page_decoration.dart';
import 'package:instagram_clone/constant/common_size.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/widgets/or_divider.dart';
import 'package:provider/provider.dart';

import '../models/firebase_auth_state.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //default 값이긴 함
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/image/insta_text_logo.png'),
              TextFormField(
                cursorColor: Colors.black45,
                controller: _emailController,
                validator: (email) {
                  if (email != null &&
                      email.isNotEmpty &&
                      email.contains('@')) {
                    return null;
                  } else {
                    return '정확한 이메일 주소를 입력해주세요.';
                  }
                },
                decoration: textInputDeco('Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: Colors.black45,
                controller: _password,
                validator: (passsword) {
                  if (passsword != null &&
                      passsword.isNotEmpty &&
                      passsword.length > 5) {
                    return null;
                  } else {
                    return '정확한 비밀 번호를 입력해주세요.';
                  }
                },
                decoration: textInputDeco('Password'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: Colors.black45,
                controller: _confirmPassword,
                validator: (confirmPassword) {
                  if (confirmPassword != null &&
                      _password.text == confirmPassword) {
                    return null;
                  } else {
                    return '비밀번호를 다시한번 확인해주세요.';
                  }
                },
                decoration: textInputDeco('Confirm Password'),
              ),
              SizedBox(
                height: common_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_gap,
              ),
              orDecoration(),
              TextButton.icon(
                style: ButtonStyle(),
                onPressed: () {Provider.of<FirebaseAuthState>(context, listen: false)
                    .changeFirebaseAuthStatus(
                    firebaseAuthStatus: FirebaseAuthStatus.signin);},
                icon: ImageIcon(AssetImage('assets/image/facebook.png'),color: Colors.blue,),
                label: Text('Login with Facebook', style: TextStyle(color: Colors.blue),),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton _submitButton(BuildContext context) {
    return TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .registerUser(context, email: _emailController.text, password: _password.text);
                }
              },
              child: Text(
                'Join',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
  }

  // outlineInputBorder 을 method로 빼줄수도 있다.

}


