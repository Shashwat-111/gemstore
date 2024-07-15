import 'package:flutter/material.dart';
import 'package:fluxstore/auth/create_new_password.dart';
import 'package:fluxstore/utils/styles.dart';
import 'package:fluxstore/widgets/custom_text_field.dart';
import 'package:fluxstore/widgets/defaultButton.dart';

import '../utils/constants.dart';
import '../widgets/otp_input_field.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
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
              Text("Verification Code", style: headingTextStyle,),
              const SizedBox(height: 20,),
              const Text("Please send the verification code we send to your email address", softWrap: true,style: choiceTextStyle,),
              const SizedBox(height: 50,),
              const OtpInputField(),
              const Text("Resend in 00:10", style: choiceTextStyle,),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: DefaultButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateNewPassword()));
                }, text: "Enter"),

              )
            ],
          ),
        ),
      ),
    );
  }
}
