import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/screens/login/forgot_password_1.dart';
import 'package:flutter_doctor_nearby/screens/login/forgot_password_3.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class Forgotpassword2Page extends StatelessWidget {
  const Forgotpassword2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 11.0, 11.0, 11.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Forgotpassword1Page(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                  )),
            ),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Check your email',
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
                'We have sent a password recovery instructions to your email.',
                style: TextStyle(fontSize: 16, color: greyContent),
              ),
            ),
            const SizedBox(height: 50),
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
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Forgotpassword3Page(),
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
                child: const Text('Open my email'),
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
                      builder: (context) => const Forgotpassword3Page(),
                    ),
                  );
                },
                child: const Text(
                  'Skip, I will confirm later',
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
