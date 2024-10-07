import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MyIconButton extends StatelessWidget {
  final double width;
  final double height;
  final String icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  const MyIconButton({
    super.key,
    this.width = 50,
    this.height = 50,
    required this.icon,
    this.iconColor = primaryColor,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 7)
            )
          ],
          color: backgroundColor,
        ),
        child: Image.asset(icon, color: iconColor),
      ),
    );
  }
}
