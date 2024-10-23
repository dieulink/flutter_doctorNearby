import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/information_card.dart';
import 'package:flutter_doctor_nearby/components/my_button.dart';
import 'package:flutter_doctor_nearby/screens/make_an_appointment/appointment_success.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class AppointmentSummary extends StatefulWidget {
  final String timeFrame;
  final String date;

  const AppointmentSummary(
      {super.key, required this.timeFrame, required this.date});

  @override
  State<AppointmentSummary> createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  int _currentIndex = 0;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  void _getAllAppointments() async {
    DatabaseEvent event = await _dbRef.child("appointments").once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      final appointments = snapshot.value as List<Object?>;

      for (var appointment in appointments) {
        if (appointment != null) {
          Map<dynamic, dynamic> appointmentData =
              appointment as Map<dynamic, dynamic>;
          int id = int.tryParse(appointmentData['id'].toString()) ?? 0;

          if (id > _currentIndex) {
            _currentIndex = id;
          }
        }
      }
    }
  }

  void _addData() {
    int newIndex = _currentIndex + 1;
    _currentIndex = newIndex;
    // ignore: avoid_single_cascade_in_expression_statements
    _dbRef.child("appointments")
      ..child(newIndex.toString()).set({
        'time': widget.timeFrame,
        'patient': 'John Doe',
        'doctor': 'Stephen Strange',
        'date': widget.date,
        'id': newIndex,
      }).then((_) {
        print('Data added successfully.');
      }).catchError((error) {
        print('Failed to add data: $error');
      });
  }

  @override
  Widget build(BuildContext context) {
    _getAllAppointments();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Summary',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Consultation Schedule', style: titleStyle),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 25.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Date',
                          style: titleCardStyle,
                        ),
                        Text(widget.date,
                            style: titleCardStyle.copyWith(
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Time',
                          style: titleCardStyle,
                        ),
                        Text(widget.timeFrame,
                            style: titleCardStyle.copyWith(
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Address',
                          style: titleCardStyle,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "97 Man Thien, District 9, Thu Duc City",
                            textAlign: TextAlign.right,
                            style: titleCardStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Doctor Information', style: titleStyle),
              const SizedBox(height: 8),
              const InformationCard(
                imageUrl: doctorStrangeAvt,
                name: "Stephen Strange",
                job: "Neurosurgeon",
                phoneNumber: "089123****",
                email: "test@test.com",
              ),
              const SizedBox(height: 20),
              const Text('Patient Information', style: titleStyle),
              const SizedBox(height: 8),
              const InformationCard(
                imageUrl: wandaAvt,
                name: "Wanda Maximoff",
                job: "Witch",
                phoneNumber: "089456****",
                email: "test@test.com",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: MyButton(
          onTap: () {
            _addData();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AppointmentSuccess(
                  timeFrame: widget.timeFrame,
                  date: widget.date,
                ),
              ),
            );
          },
          label: 'Make my appointment',
          backgroundColor: primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
