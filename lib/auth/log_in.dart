import 'package:flutter/material.dart';
import 'package:fluxstore/auth/forgot_password.dart';
import 'package:fluxstore/auth/sign_up.dart';
import 'package:fluxstore/utils/styles.dart';
import 'package:fluxstore/widgets/defaultButton.dart';
import 'package:fluxstore/widgets/social_icon_login_row.dart';

import '../utils/constants.dart';
import '../widgets/custom_text_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - (defaultPadding*2),
            width: MediaQuery.of(context).size.width -(defaultPadding*2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login into\nyour account", style: headingTextStyle,)),
                CustomTextField(controller: emailController, hintText: "Email address"),
                CustomTextField(controller: passwordController, hintText: "Password"),
                Align(
                    alignment : Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                      },
                        child: const Text("Forgot password?", style: choiceTextStyle,))),
                const SizedBox(height: 60),
                DefaultButton(
                  onPressed: (){},
                  text: "Sign Up",
                ),
                const Text("or sign up with", style: choiceTextStyle,),
                SocialIconLoginRow(
                  onPressedApple: (){},
                  onPressedFacebook:(){} ,
                  onPressedGoogle: (){},
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have a account?"),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignUp()));
                    }, child: const Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}