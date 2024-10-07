import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class SpecialityCard extends StatelessWidget {
  const SpecialityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(pulmonologyIcon),
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gastroenterology',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text('10 Doctor', style: TextStyle(
                fontSize: 16,
                color: greyContent
              ),),
            ],
          ),
        ],
      ),
    );
  }
}