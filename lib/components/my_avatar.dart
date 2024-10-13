import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MyAvatar extends StatelessWidget {
  final double width;
  final double height;
  final String avatarUrl;
  const MyAvatar({
    super.key,
    this.width = 120,
    this.height = 170,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          avatarUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
