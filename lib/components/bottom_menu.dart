import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/appointment_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/chat_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/favorite_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/home_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/profile_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class MyBottomMenu extends StatefulWidget {
  const MyBottomMenu({super.key});

  @override
  State<MyBottomMenu> createState() => _MyBottomMenuState();
}

class _MyBottomMenuState extends State<MyBottomMenu> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    const screens = [
      HomePage(),
      ChatPage(),
      AppointmentPage(),
      FavoritePage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: screens[index],
      // using bottomSheet instead of bottomNav if you want the navBar move up when the keyboard appears
      bottomSheet: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (item) {
          setState(() {
            index = item;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(index == 0 ? homeSelectedIcon : homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(index == 1 ? chatSelectedIcon : chatIcon),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                index == 2 ? appointmentSelectedIcon : appointmentIcon),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(index == 3 ? favoriteSelectedIcon : favoriteIcon),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(index == 4 ? profileSelectedIcon : profileIcon),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
