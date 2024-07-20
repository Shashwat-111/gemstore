import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxstore/screens/main_scaffold.dart';
import 'package:fluxstore/utils/styles.dart';
import 'package:fluxstore/widgets/custom_text_field.dart';
import 'package:fluxstore/widgets/default_button.dart';

import '../utils/constants.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - (defaultPadding*2),
            width: MediaQuery.of(context).size.width -(defaultPadding*2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create a new password", style: headingTextStyle,softWrap: true,),
                const SizedBox(height: 20,),
                const Text("Your password must me different form the previously used password", softWrap: true,style: choiceTextStyle,),
                const SizedBox(height: 50,),
                CustomTextField(controller: newPasswordController, hintText: "New Password", obscureText: true,),
                const SizedBox(height: 20,),
                CustomTextField(controller: confirmPasswordController, hintText: "Confirm Password", obscureText: true,),
                const SizedBox(height: 50,),
                Align(
                  alignment: Alignment.center,
                  child: DefaultButton(onPressed: (){
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    showModalBottomSheet(context: context, builder: (context2){
                      return Container(
                        width: double.infinity,
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                        ),
                        child: Column(
                            children: [
                              const SizedBox(height: 20),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[200],
                                child: Center(child: Image.asset("assets/passwordChangeSuccessful.png")),
                              ),
                              const SizedBox(height: 20),
                              const Text("Your Password has been Changed!", softWrap: true,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 200,
                                  height: 40,
                                  child: DefaultButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                                  }, text: "Browse Home"))
                            ]
                        ),
                      );
                    });
                  }, text: "Enter"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
