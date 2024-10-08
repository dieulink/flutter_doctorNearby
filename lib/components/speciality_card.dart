import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class SpecialityCard extends StatelessWidget {
  final String imageUrl;
  final int numberDoctor;
  final String nameDisease;
  const SpecialityCard({
    super.key,
    required this.imageUrl,
    required this.numberDoctor,
    required this.nameDisease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(imageUrl),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameDisease,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$numberDoctor Doctor',
                style: const TextStyle(fontSize: 16, color: greyContent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
