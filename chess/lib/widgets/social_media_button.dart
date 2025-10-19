import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const SocialMediaButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: IconButton(
        onPressed: onPressed,
        icon: Center(child: icon),
        iconSize: 24,
        splashRadius: 28,
      ),
    );
  }
}
