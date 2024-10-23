import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/bottom_menu.dart';
import 'package:flutter_doctor_nearby/components/my_button.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/appointment_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class AppointmentSuccess extends StatelessWidget {
  final String timeFrame;
  final String date;
  const AppointmentSuccess(
      {super.key, required this.timeFrame, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(tickSquareIcon),
              ),
              const Text(
                'Appointment',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Booked',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: primaryColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                  child: Image.asset(
                                    doctorStrangeAvt,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Stephen Strange',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Neurosurgeon',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(starIcon),
                              ),
                              const Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Date',
                                style: titleCardStyle,
                              ),
                              Text(date,
                                  style: titleCardStyle.copyWith(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Time',
                                style: titleCardStyle,
                              ),
                              Text(timeFrame,
                                  style: titleCardStyle.copyWith(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Address',
                                style: titleCardStyle,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "97 Man Thien, District 9, Thu Duc City",
                                  textAlign: TextAlign.right,
                                  style: titleCardStyle.copyWith(
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: MyButton(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AppointmentPage(),
            ),
          ),
          label: 'OK',
          backgroundColor: primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
