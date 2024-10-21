import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/appoinment_shadow_card.dart';
import 'package:flutter_doctor_nearby/components/doctor_card_item.dart';
import 'package:flutter_doctor_nearby/components/icon_button.dart';
import 'package:flutter_doctor_nearby/components/speciality_card.dart';
import 'package:flutter_doctor_nearby/screens/doctor_detailed_page.dart';
import 'package:flutter_doctor_nearby/screens/edit_information.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/appointment_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/chat_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/favorite_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/notification_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/profile_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBookedAppoinment = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: defaulPagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: greyContent),
                            prefixIcon: Image.asset(searchIcon),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: greyColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: primaryColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: redColor)),
                          ),
                        ),
                        Visibility(
                          visible: isBookedAppoinment,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'My Appointment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Center(
                                child: AppoinmentShadowCard(size: size),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nearby Doctor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, builder) {
                                return Row(
                                  children: [
                                    DoctorCardItem(
                                      nameDoctor: 'Stephen Strange',
                                      speciality: 'Neurosurgeon',
                                      avatarUrl: doctorStrangeRemoveBg,
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DoctorDetailedPage(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: isBookedAppoinment ? 0.22 : 0.5,
              minChildSize: isBookedAppoinment ? 0.22 : 0.5,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(borderRadius),
                      left: Radius.circular(borderRadius),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 45,
                          height: 5,
                          decoration: BoxDecoration(
                            color: greyContent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: diseases.length,
                          itemBuilder: (context, index) {
                            return SpecialityCard(
                              imageUrl: diseases[index].imageUrl,
                              numberDoctor: diseases[index].numberDoctor,
                              nameDisease: diseases[index].diseaseName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, -10)),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Image.asset(homeSelectedIcon)),
            IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatPage())),
              icon: Image.asset(chatIcon),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppointmentPage())),
              icon: Image.asset(appointmentIcon),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavoritePage())),
              icon: Image.asset(favoriteIcon),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfilePage())),
              icon: Image.asset(profileIcon),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      avtSample,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Location',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EditInformationPage()));
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Enter an address',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset(arrowDownIcon),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MyIconButton(
              width: 42,
              height: 42,
              icon: bellIcon,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
