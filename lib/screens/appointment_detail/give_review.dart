import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/bottom_menu.dart';
import 'package:flutter_doctor_nearby/screens/appointment_detail/appointment_done.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class GiveReview extends StatelessWidget {
  const GiveReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AppointmentDone(),
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
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    doctorStrangeAvt,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "How did  you like the service from ",
              style: TextStyle(fontSize: 16),
            ),
            RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                  TextSpan(
                    text: "the doctor ",
                  ),
                  TextSpan(
                    text: "Stephen Strange ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "as",
                  ),
                ])),
            const Text(
              "Dermatologist ?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 221, 21),
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 221, 21),
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 221, 21),
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: greyColor,
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: greyColor,
                  size: 50,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Placeholder',
                  labelStyle: const TextStyle(color: greyContent),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: greyContent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Do you wan to make him/her ",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "as your personal doctor?",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text("Yes"),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: null,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("No"),
                    leading: Radio<int>(
                      value: 0,
                      groupValue: null,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(16))),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MyBottomMenu(),
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
          child: const Text(
            "Give your review",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
