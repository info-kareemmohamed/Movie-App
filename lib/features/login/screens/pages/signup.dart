import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/space.dart';
import '../../../../core/utils/text_style.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool secure = true;
  bool secure2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpaceVH(height: 40.0),
                Text(
                  'Create new account',
                  style: headline1,
                ),
                SpaceVH(height: 5.0),
                Text(
                  'Register now and start expoling all that our app has to\n offer.we are exicted to welcome you in our community',
                  style: headline3,
                ),
                SpaceVH(height: 50.0),
                CustomTextField(
                  controller: userEmail,
                  keyBordType: TextInputType.emailAddress,
                  icon: Icons.person_outline_outlined,
                  hintTxt: 'Email Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                  },
                ),
                CustomTextField(
                  controller: userPass,
                  icon: secure ? Icons.visibility_off : Icons.visibility,
                  isObs: secure,
                  visible: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                  hintTxt: ' Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    if (value.length < 4) {
                      return 'password too short';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: userPass,
                  icon: secure2 ? Icons.visibility_off : Icons.visibility,
                  isObs: secure2,
                  visible: () {
                    setState(() {
                      secure2 = !secure2;
                    });
                  },
                  hintTxt: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password required";
                    }
                  },
                ),
                CustomTextField(
                  controller: userPh,
                  icon: Icons.phone,
                  keyBordType: TextInputType.phone,
                  hintTxt: 'Your Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number required";
                    }
                  },
                ),
                SpaceVH(height: 25.0),
                Mainbutton(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    }
                  },
                  text: 'Sign Up',
                  txtColor: black,
                  btnColor: greenButton,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "By logging.you agree to our ",
                              style: headline3),
                          TextSpan(
                              text: "Terms & Conditions", style: headline2),
                          TextSpan(text: " and ", style: headline3),
                          TextSpan(
                              text: "Privacy Policy",
                              style: headline2.copyWith(
                                height: 1.5,
                              )),
                        ],
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                SpaceVH(height: 30.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: headline.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: headlineDot.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ]),
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
