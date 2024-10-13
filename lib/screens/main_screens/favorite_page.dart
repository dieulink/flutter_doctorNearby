import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/doctor_card_item.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 8.0, bottom: 16.0),
                child: Text(
                  'My Doctor',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: doctorList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DoctorCardItem(
                      width: double.infinity,
                      avatarUrl: doctorList[index].imageUrl,
                      nameDoctor: doctorList[index].doctorName,
                      speciality: doctorList[index].speciality,
                      customAfterInfoLine: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: lightBlue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Online',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset(starIcon),
                              ),
                              Text(
                                doctorList[index].rating.toString(),
                                style: const TextStyle(fontSize: 14, color: greyContent),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
