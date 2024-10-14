import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/screens/edit_information.dart';
import 'package:flutter_doctor_nearby/screens/login/login_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/notification_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 56.0, left: 20.0, bottom: 16.0),
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: const BoxDecoration(
                  color: disableColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(borderRadius),
                              child: Image.asset(
                                wandaAvt,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello',
                                  style: subTitleStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Wanda Maximoff',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(logOutIcon),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Personal', style: titleStyle),
                    const SizedBox(height: 10),
                    _buildTappedItem(
                        label: 'Account', iconUrl: personIcon, onTap: () {}),
                    const SizedBox(height: 5),
                    _buildTappedItem(
                      label: 'Personal Data',
                      iconUrl: documentIcon,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EditInformationPage(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('General', style: titleStyle),
                    const SizedBox(height: 10),
                    _buildTappedItem(
                      label: 'Notification',
                      iconUrl: blackBellIcon,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    _buildTappedItem(
                        label: 'Security', iconUrl: securityIcon, onTap: () {}),
                    const SizedBox(height: 5),
                    _buildTappedItem(
                        label: 'Help', iconUrl: helpIcon, onTap: () {}),
                    const SizedBox(height: 5),
                    _buildTappedItem(
                        label: 'About', iconUrl: aboutIcon, onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTappedItem({iconUrl, label, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(iconUrl),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
