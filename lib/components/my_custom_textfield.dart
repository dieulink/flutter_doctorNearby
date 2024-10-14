import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MyCustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? textEditingController;
  final Icon? prefixIcon;
  const MyCustomTextField({
    super.key,
    this.label = '',
    this.textEditingController,
    this.hintText = '',
    this.prefixIcon,
  });

  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 17)),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.textEditingController,
          decoration: InputDecoration(
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: greyContent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: greyContent,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: greyContent,
            ),
            prefixIcon: widget.prefixIcon,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
