import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, this.onPressed}) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.1)
      ),
      width: 45,
      height: 45,
      child: IconButton(
        onPressed:onPressed,
        icon: Icon(icon,
        size: 25,
      ),
    ),
    );
  }
}
