import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/my_avatar.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class InformationCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String job;
  final String phoneNumber;
  final String email;
  const InformationCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.job,
    required this.phoneNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: greyContent),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Row(
            children: [
              MyAvatar(
                avatarUrl: imageUrl,
                width: 60,
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: titleStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    job,
                    style: subTitleStyle,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: greyColor,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: greyContent,
                  ),
                ),
                child: Image.asset(phoneIcon),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone",
                    style: TextStyle(fontSize: 14, color: greyContent),
                  ),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: greyContent,
                  ),
                ),
                child: Image.asset(mailIcon),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 14, color: greyContent),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
