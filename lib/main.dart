import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_doctor_nearby/firebase_options.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/appointment_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/chat_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/favorite_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/home_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/notification_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/profile_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';
import 'package:flutter_doctor_nearby/screens/onboarding_page/onboarding_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
