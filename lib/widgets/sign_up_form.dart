import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/common_size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: common_l_gap,
            ),
            Image.asset('assets/image/insta_text_logo.png'),
            TextFormField(
              controller: _emailController,
              validator: (email){
                if(email != null && email.isNotEmpty && email.contains('@')){
                  return null;
                }else{
                 return '정확한 이메일 주세를 입력해주세요.';
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
