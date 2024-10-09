import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/my_button.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class DoctorCardItem extends StatelessWidget {
  final String avatarUrl;
  final String nameDoctor;
  final String speciality;
  final VoidCallback? onTap;
  const DoctorCardItem({
    super.key,
    this.onTap,
    required this.avatarUrl,
    required this.nameDoctor,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.8,
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          16,
          defaultMargin,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 108,
              padding: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  avatarUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameDoctor,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      speciality,
                      style: const TextStyle(fontSize: 15, color: greyContent),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.asset(starIcon)),
                            const Text(
                              '4.5',
                              style: TextStyle(color: greyContent),
                            ),
                          ],
                        ),
                        MyButton(
                          width: 70,
                          height: 35,
                          label: 'Status',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
