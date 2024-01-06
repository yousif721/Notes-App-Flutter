import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon, this.onPressed}) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      const Spacer(),
      CustomIcon(
        icon: icon,
        onPressed: onPressed,
      ),
    ]);
  }
}

