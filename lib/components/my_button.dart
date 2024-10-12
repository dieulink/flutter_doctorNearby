import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback? onTap;
  bool isChosen;
  MyButton({
    super.key,
    this.width = 150,
    this.height = 50,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = lightBlue,
    this.onTap,
    this.fontSize = 14,
    this.isChosen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: !isChosen ? backgroundColor : primaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isChosen ? textColor : greyColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
