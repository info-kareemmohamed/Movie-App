import 'package:flutter/material.dart';
import 'package:flutter_project/features/login/screens/pages/signup.dart';
import 'package:flutter_project/features/login/screens/pages/social_icons.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/space.dart';
import '../../../../core/utils/text_style.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SpaceVH(height: 50.0),
                Image.asset("assets/images/img1.png"),
                const SpaceVH(height: 50),
                CustomTextField(
                    controller: userName,
                    icon: Icons.person_outline_outlined,
                    hintTxt: 'UserName',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "username required";
                      }
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: userPass,
                  icon: secure ? Icons.visibility_off : Icons.visibility,
                  isObs: secure,
                  visible: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                  hintTxt: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SpaceVH(height: 20.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Mainbutton(
                        onTap: () {
                          if (fromKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                          }
                        },
                        text: 'Sign in',
                        txtColor: black,
                        btnColor: greenButton,
                      ),
                      const SocalSignUp(),
                      const SpaceVH(height: 10.0),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => SignUpPage()));
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don\'t have account? ",
                                  style: headline.copyWith(fontSize: 14.0)),
                              TextSpan(
                                  text: "Register",
                                  style: headlineDot.copyWith(
                                      fontSize: 14.0, color: blueText))
                            ]),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
