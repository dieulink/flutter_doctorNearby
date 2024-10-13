import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/doctor_card_item.dart';
import 'package:flutter_doctor_nearby/components/my_button.dart';
import 'package:flutter_doctor_nearby/screens/make_an_appointment/appointment_summary.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  int chosenMonth = 0;
  int selectedButtonIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
        ),
      ),
      body: Padding(
        padding: defaulPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DoctorCardItem(
              avatarUrl: doctorStrangeRemoveBg,
              nameDoctor: 'Stephen Strange',
              speciality: 'Neurosurgeon',
              isJustInfo: true,
            ),
            const SizedBox(height: 20),
            const Text('Date & Time', style: titleStyle),
            EasyDateTimeLine(
              initialDate: getDateTimeList(activeDateTimeList)[0],
              headerProps: const EasyHeaderProps(
                  showHeader: true, showSelectedDate: false),
              disabledDates: getFilteredDates(DateTime(DateTime.now().year),
                  DateTime(DateTime.now().year + 1)),
              timeLineProps: const EasyTimeLineProps(hPadding: 0.0),
              dayProps: EasyDayProps(
                height: 85,
                width: 58,
                borderColor: greyContent,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                inactiveDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: greyContent),
                  ),
                ),
                disabledDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: disableColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                todayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: greyContent),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3,
                children: activeHours.map((e) {
                  int index = activeHours.indexOf(e);
                  return MyButton(
                    label: activeHours[index],
                    backgroundColor: Colors.white,
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = index;
                      });
                    },
                    isChosen: selectedButtonIndex == index,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: MyButton(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AppointmentSummary(),
            ),
          ),
          label: 'Next',
          backgroundColor: primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
