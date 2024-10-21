import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/bottom_menu.dart';
import 'package:flutter_doctor_nearby/screens/login/forgot_password_1.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/home_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            padding: EdgeInsets.only(right: 150, left: 20),
            tabs: [
              Tab(text: "Login"),
              Tab(text: "Register"),
            ],
            dividerColor: Colors.transparent,
            labelColor: primaryColor,
            unselectedLabelColor: greyContent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: primaryColor,
                width: 2,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab, // phủ toàn bộ tab
          ),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 50.0, 11.0, 11.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Wellcome",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Back",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: greyColor,
                ),
                labelStyle: TextStyle(color: greyColor),
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: greyColor,
                ),
                labelStyle: TextStyle(color: greyColor),
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Forgotpassword1Page(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot your password ?',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                          HomePage(),
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
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 50.0, 11.0, 11.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Create",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Account",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: greyColor,
                ),
                labelStyle: TextStyle(color: greyColor),
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: greyColor,
                ),
                labelStyle: TextStyle(color: greyColor),
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: greyColor,
                ),
                labelStyle: TextStyle(color: greyColor),
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                          HomePage(),
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
                child: const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
