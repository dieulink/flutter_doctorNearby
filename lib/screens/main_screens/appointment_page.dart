import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/screens/appointment_detail/appointment_done.dart';
import 'package:flutter_doctor_nearby/screens/appointment_detail/appointment_on_going.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/chat_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/favorite_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/home_page.dart';
import 'package:flutter_doctor_nearby/screens/main_screens/profile_page.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class AppointmentPage extends StatefulWidget {
  final String? timeFrame;
  final String? date;
  const AppointmentPage({super.key, this.timeFrame, this.date});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  String _data = "No data";
  int _currentIndex = 0;
  List<Object?> _appointments = [];

  @override
  void initState() {
    super.initState();
    _listenToRealtimeData();
    _getAllAppointments();
  }

  void _getAllAppointments() async {
    DatabaseEvent event = await _dbRef.child("appointments").once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      final appointments = snapshot.value as List<Object?>;

      int maxId = 0;

      for (var appointment in appointments) {
        if (appointment != null) {
          _appointments.add(appointment);
          Map<dynamic, dynamic> appointmentData =
              appointment as Map<dynamic, dynamic>;
          int id = int.tryParse(appointmentData['id'].toString()) ?? 0;

          if (id > maxId) {
            maxId = id;
          }
        }
      }

      setState(() {
        _currentIndex = maxId;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  void _listenToRealtimeData() {
    _dbRef.child("appointments").onValue.listen((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      setState(() {
        _data = snapshot.value.toString();
      });
    });
  }

  void _getDataOnce() async {
    DatabaseEvent event = await _dbRef.child("appointments").once();
    DataSnapshot snapshot = event.snapshot;
    setState(() {
      _data = snapshot.value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: const Padding(
              padding: EdgeInsets.only(top: 90, left: 20),
              child: Text(
                "My Appointment",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottom: TabBar(
              padding: const EdgeInsets.only(right: 150, left: 20),
              tabs: const [
                Tab(text: "Active"),
                Tab(text: "History"),
              ],
              onTap: (value) {
                // _addData();
              },
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
        ),
        body: TabBarView(
          children: [
            ActiveTab(
              appointments: _appointments,
            ),
            HistoryTab(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, -10)),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                  icon: Image.asset(homeIcon)),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChatPage())),
                icon: Image.asset(chatIcon),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(appointmentSelectedIcon),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritePage())),
                icon: Image.asset(favoriteIcon),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage())),
                icon: Image.asset(profileIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveTab extends StatelessWidget {
  final List<Object?> appointments;
  const ActiveTab({super.key, required this.appointments});

  Widget item(BuildContext context, Map<dynamic, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 16, left: 16),
      child: SingleChildScrollView(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: primaryColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                              doctorStrangeAvt,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['doctor']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Neurosurgeon',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(borderRadius),
                              color: disableColor,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        AppointmentOnGoing(
                                      date: data['date'],
                                      timeFrame: data['time'],
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.navigate_next_outlined,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "On going",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${data['date']} at ${data['time']!} ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return item(context, appointments[index] as Map<dynamic, dynamic>);
        },
        itemCount: appointments.length);
    // item(context);
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: greyColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                              edwardAvt,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edward Cullen',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Desmatologist',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        AppointmentDone(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
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
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                                color: greyColor,
                              ),
                              child: const Icon(
                                Icons.navigate_next_rounded,
                                color: primaryColor,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: greyContent,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Thu, Jan 11 at 09.00 AM - 11.30 AM  ",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
