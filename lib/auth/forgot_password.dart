import 'package:flutter/material.dart';
import 'package:fluxstore/auth/verification_code.dart';
import 'package:fluxstore/utils/styles.dart';
import 'package:fluxstore/widgets/custom_text_field.dart';
import 'package:fluxstore/widgets/defaultButton.dart';

import '../utils/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon : const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body:Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - (defaultPadding*2),
          width: MediaQuery.of(context).size.width -(defaultPadding*2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password?", style: headingTextStyle,),
              const SizedBox(height: 20,),
              const Text("Enter email associated with your account and we'll send and email with intructions to reset your password", softWrap: true,style: choiceTextStyle,),
              const SizedBox(height: 50,),
              CustomTextField(controller: emailController, hintText: "enter your email here", prefixIcon: const Icon(Icons.email_outlined),),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: DefaultButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationCode()));
                    }, text: "Send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
