import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/my_custom_textfield.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class EditInformationPage extends StatefulWidget {
  const EditInformationPage({super.key});

  @override
  State<EditInformationPage> createState() => _EditInformationPageState();
}

class _EditInformationPageState extends State<EditInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Personal Data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'Save',
                style: TextStyle(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(wandaAvt),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                          ),
                        ),
                        width: 30,
                        height: 30,
                        child: Image.asset(editIcon),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const MyCustomTextField(
                label: 'Name',
                hintText: 'Wanda Maximoff',
              ),
              const MyCustomTextField(
                label: 'Date of Birth',
                hintText: '06 September 1996',
                prefixIcon: Icon(Icons.calendar_month),
              ),
              const MyCustomTextField(
                label: 'Phone Number',
                hintText: '0123456789',
              ),
              const MyCustomTextField(
                label: 'Address',
                hintText: 'Slovakia',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
