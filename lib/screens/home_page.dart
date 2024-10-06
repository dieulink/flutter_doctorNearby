import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100, 
              child: Image.asset(avtSample),
            ),
            Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
