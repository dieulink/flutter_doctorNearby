import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/onBoarding/onBoarding_page3.dart';
import 'package:flutter_doctor_nearby/screens/home_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 108.0, 11.0, 11.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/onBoarding2.png',
              width: 353,
              height: 272,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Find doctor near you',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Find trusted general practitioners and specialists near you.',
                style: TextStyle(fontSize: 16, color: greyContent),
              ),
            ),
            const SizedBox(height: 80),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const OnboardingPage3(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text('Next'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
