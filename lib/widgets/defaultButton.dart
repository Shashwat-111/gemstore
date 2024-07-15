import 'package:flutter/material.dart';
import 'package:fluxstore/utils/colors.dart';

import '../utils/styles.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const DefaultButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 40)),
          backgroundColor: defaultButtonColor,
        ),
        child: Text(text, style: buttonTextStyle,),
    );
  }
}
