import 'package:flutter/material.dart';

class SocialIconLoginRow extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedApple;
  final VoidCallback onPressedFacebook;
  const SocialIconLoginRow({super.key, required this.onPressedGoogle, required this.onPressedApple, required this.onPressedFacebook});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressedApple,
            icon: Image.asset("assets/appleIcon.png"),
        ),
        IconButton(
          onPressed: onPressedGoogle,
          icon: Image.asset("assets/googleIcon.png"),
        ),
        IconButton(
          onPressed: onPressedFacebook,
          icon: Image.asset("assets/facebookIcon.png"),
        ),
      ],
    );
  }
}
