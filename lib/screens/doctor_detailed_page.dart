import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/components/my_button.dart';
import 'package:flutter_doctor_nearby/ui_values.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailedPage extends StatefulWidget {
  const DoctorDetailedPage({super.key});

  @override
  State<DoctorDetailedPage> createState() => _DoctorDetailedPageState();
}

class _DoctorDetailedPageState extends State<DoctorDetailedPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: defaulPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 170,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Image.asset(
                        doctorStrangeAvt,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Stephen Strange',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const Text(
                        'Neurosurgeon',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: greyContent),
                      ),
                      const SizedBox(height: 25),
                      _buildInforNumber(
                          imageUrl: starIcon,
                          label: 'Rating',
                          number: 5.0,
                          numberRating: 1810),
                      const SizedBox(height: 10),
                      _buildInforNumber(
                          imageUrl: briefcaseIcon,
                          label: 'Experience (year)',
                          number: 2),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Profile', style: titleStyle),
              const SizedBox(height: 5),
              const ReadMoreText(
                'Vain, egotistic surgeon Stephen Strange lost the use of his hands in a horrific auto accident caused by his own recklessness. In turn, he lost his fortune through a series of costly, complicated and experimental surgeries and therapies in an attempt to save his livelihood. In the end, destitute and desperate, he sought a cure far off the beaten path of modern medicine.\nIn Nepal, after being saved from muggers by the powerful sorcerer Mordo, Strange met the person who had taught Mordo—Earth’s Sorcerer Supreme, the Ancient One, who held many mysteries of the Old World, including the potential to heal Strange’s hands. The Ancient One refused to guide Strange through the process until he relinquished his selfishness and opened his mind to a higher truth. Having done so, the doctor began to learn of the Multiverse and the ancient science of magic, as well as forbidden knowledge the Ancient One was not inclined to share. ',
                textAlign: TextAlign.justify,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                trimLines: 4,
                trimMode: TrimMode.Line,
                style: TextStyle(fontSize: 15),
                moreStyle:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
                lessStyle:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              const Text('Schedule', style: titleStyle),
              const SizedBox(height: 10),
              _buildCalendar(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: greyContent),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              wandaAvt,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wanda Maximoff',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Witch',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: greyContent,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Image(
                          image: AssetImage(starIcon),
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 14,
                            color: greyContent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: MyButton(
          onTap: () {},
          label: 'Make an appointment',
          backgroundColor: primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }

  EasyInfiniteDateTimeLine _buildCalendar() {
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime.now(),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 8),
      disabledDates: unactiveDateTimeList,
      showTimelineHeader: false,
      timeLineProps: const EasyTimeLineProps(hPadding: 0.0),
      dayProps: EasyDayProps(
        height: 85,
        width: 58,
        borderColor: greyContent,
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayNumStyle: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          dayStrStyle: const TextStyle(
            color: dayStrCalendarColor,
            fontSize: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: greyContent),
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
      focusDate: null,
    );
  }

  Widget _buildInforNumber({imageUrl, label, number, int? numberRating}) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: greyContent,
            ),
          ),
          child: Image.asset(imageUrl),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: greyContent),
            ),
            Row(
              children: [
                Text(
                  '$number  ',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Visibility(
                  visible: numberRating != null,
                  child: Text(
                    '($numberRating)  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: greyContent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
