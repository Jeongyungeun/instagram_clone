import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';
import 'package:instagram_clone/home_page.dart';

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
                decoration: _textInputDeco('Email'),
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
                decoration: _textInputDeco('Password'),
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
                decoration: _textInputDeco('Confirm Password'),
              ),
              SizedBox(
                height: common_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_gap,
              ),
              _orDivider(),
              TextButton.icon(
                style: ButtonStyle(),
                onPressed: () {},
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
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
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

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.grey[300],
          height: 1,
        ),
        Container(
          color: Colors.grey[50],
          height: 3,
          width: 60,
        ),
        Text(
          'OR',
          style: TextStyle(color: Colors.grey[500]),
        )
      ],
    );
  }

  // outlineInputBorder 을 method로 빼줄수도 있다.
  InputDecoration _textInputDeco(String hintContents) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.grey[100],
      hintText: hintContents,
      hintStyle: TextStyle(color: Colors.grey[500]),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
