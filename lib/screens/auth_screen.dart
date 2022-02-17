import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/widgets/fade_stack.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';
import 'package:instagram_clone/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(selectedForm: _selectedForm),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          if (_selectedForm == 0) {
                            _selectedForm = 1;
                          } else {
                            _selectedForm = 0;
                          }
                          setState(() {});
                        },
                        child: RichText(
                          text: TextSpan(
                              text: (_selectedForm == 0)
                                  ? 'Already have a account? '
                                  : "Don't have an account? ",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: (_selectedForm == 0)
                                      ? 'Sign In'
                                      : 'Sign up',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///처음에는 밑에 같이 코드를 짜 줬다. 하지만 AnimatedSwitcher 를 사용하면 rebuil 되면서
///인스턴스가 새롭게 계속 생성된다.

// class _AuthScreenState extends State<AuthScreen> {
//
//   Widget signUpForm = SignUpForm();
//   Widget signinForm = SignInForm();
//
//   late Widget currentWidget;
//
//   @override
//   void initState() {
//       currentWidget = signUpForm;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AnimatedSwitcher(duration: duration,
//             child: currentWidget,),
//             Container(
//               child: TextButton(
//                 onPressed: () {
//                   if(currentWidget is SignUpForm){
//                     currentWidget = signinForm;
//                   }else{
//                     currentWidget = signUpForm;
//                   }
//                   setState(() {
//                   });
//                 },
//                 child: Text('go to sign up', style: TextStyle(color: Colors.black87),),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
