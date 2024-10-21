import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/models/disease.dart';
import 'package:flutter_doctor_nearby/models/doctor.dart';
import 'package:flutter_doctor_nearby/models/notification.dart';

// color
const primaryColor = Color(0xff0D53FC);
const lightBlue = Color(0xff53A1FD);
const extraLightBlue = Color(0xff96B5FF);
const disableColor = Color(0xffEBF1F9);
const lightGrey = Color(0xffCFD6E7);
const greyColor = Color(0xffDEDEDE);
const redColor = Color(0xffFE4E4E);
const lightRed = Color(0xffE8505B);
const greenColor = Color(0xff2FCB82);
const greyContent = Color(0xffAAAAAA);
const dayStrCalendarColor = Color(0xff8F8F8F);

// images
const avtSample = 'assets/images/avt_sample.jpg';
const doctorAvt = 'assets/images/doctor_avt.png';
const doctorStrangeAvt = 'assets/images/doctor_strange.jpg';
const wandaAvt = 'assets/images/wanda_avt.jpg';
const doctorStrangeRemoveBg = 'assets/images/doctor_strange_removebg.png';
const edwardAvt = 'assets/images/edward_avt.jpg';

// icons
const arrowDownIcon = 'assets/icons/arrow_down_icon.png';
const bellIcon = 'assets/icons/bell_icon.png';
const searchIcon = 'assets/icons/search_icon.png';
const starIcon = 'assets/icons/star_icon.png';
const rightIcon = 'assets/icons/right_icon.png';
const homeIcon = 'assets/icons/home_icon.png';
const homeSelectedIcon = 'assets/icons/home_selected_icon.png';
const chatIcon = 'assets/icons/chat_icon.png';
const chatSelectedIcon = 'assets/icons/chat_selected_icon.png';
const appointmentIcon = 'assets/icons/list_icon.png';
const appointmentSelectedIcon = 'assets/icons/list_selected_icon.png';
const favoriteIcon = 'assets/icons/favorite_icon.png';
const favoriteSelectedIcon = 'assets/icons/favorite_selected_icon.png';
const profileIcon = 'assets/icons/profile_icon.png';
const profileSelectedIcon = 'assets/icons/profile_selected_icon.png';
const pulmonologyIcon = 'assets/icons/pulmonology_icon.png';
const gastroenterologyIcon = 'assets/icons/gastroenterology_icon.png';
const hepatologyIcon = 'assets/icons/hepatology_icon.png';
const neurologyIcon = 'assets/icons/neurology_icon.png';
const ophthalmologyIcon = 'assets/icons/ophthalmology_icon.png';
const hematologyIcon = 'assets/icons/hematology_icon.png';
const gynecologyIcon = 'assets/icons/gynecology_icon.png';
const briefcaseIcon = 'assets/icons/briefcase_icon.png';
const mailIcon = 'assets/icons/mail_icon.png';
const phoneIcon = 'assets/icons/phone_icon.png';
const tickSquareIcon = 'assets/icons/tick_square.png';
const logOutIcon = 'assets/icons/log_out_icon.png';
const personIcon = 'assets/icons/person_icon.png';
const documentIcon = 'assets/icons/document_icon.png';
const blackBellIcon = 'assets/icons/bell_black_icon.png';
const securityIcon = 'assets/icons/security_icon.png';
const helpIcon = 'assets/icons/help_icon.png';
const aboutIcon = 'assets/icons/about_icon.png';
const editIcon = 'assets/icons/edit_icon.png';

// number
const defaultMargin = 8.0;
const defaulPagePadding = EdgeInsets.all(16.0);
const borderRadius = 10.0;

// text style
const titleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const titleCardStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const subTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: greyContent,
);

// fake data
List<Disease> diseases = [
  Disease(
    imageUrl: gastroenterologyIcon,
    diseaseName: 'Gastroenterology',
    numberDoctor: 10,
  ),
  Disease(
    imageUrl: pulmonologyIcon,
    diseaseName: 'Pulmonology',
    numberDoctor: 9,
  ),
  Disease(
    imageUrl: hepatologyIcon,
    diseaseName: 'Hepatology',
    numberDoctor: 8,
  ),
  Disease(
    imageUrl: hematologyIcon,
    diseaseName: 'Hematology',
    numberDoctor: 5,
  ),
  Disease(
    imageUrl: ophthalmologyIcon,
    diseaseName: 'Ophthalmology',
    numberDoctor: 7,
  ),
  Disease(
    imageUrl: gynecologyIcon,
    diseaseName: 'Gynecology',
    numberDoctor: 3,
  ),
  Disease(
    imageUrl: neurologyIcon,
    diseaseName: 'Neurology',
    numberDoctor: 9,
  ),
];

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List<DateTime> activeDateTimeList = [
  DateTime(2024, 10, 10),
  DateTime(2024, 10, 13),
  DateTime(2024, 10, 15),
  DateTime(2024, 10, 20),
  DateTime(2024, 10, 27),
  DateTime(2024, 10, 30),
  DateTime(2024, 11, 5),
];

List<String> activeHours = ['10:00 - 12:00', '15:00 - 17:00', '18:30 - 20:00'];

List<Doctor> doctorList = [
  Doctor(
    imageUrl: doctorStrangeAvt,
    doctorName: 'Stephen Strange',
    speciality: 'Neurosurgeon',
    rating: 5.0,
  ),
  Doctor(
    imageUrl: doctorAvt,
    doctorName: 'Arus Elim',
    speciality: 'Hepatologist',
    rating: 4.8,
  ),
  Doctor(
    imageUrl: edwardAvt,
    doctorName: 'Edward Cullen',
    speciality: 'Desmatologist',
    rating: 4.5,
  ),
];

// some logic functions
List<DateTime> getFilteredDates(startDate, endDate) {
  // DateTime startDate = DateTime(2024, 10, 1);
  // DateTime endDate = DateTime(2024, 10, 31);

  List<DateTime> dateList = [];

  for (DateTime date = startDate;
      date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
      date = date.add(const Duration(days: 1))) {
    // Check and exclude free day
    if (!activeDateTimeList.any((excluded) =>
        excluded.year == date.year &&
        excluded.month == date.month &&
        excluded.day == date.day)) {
      dateList.add(date);
    }
  }
  return dateList;
}

List<DateTime> getDateTimeList(List<DateTime> activeList) {
  for (int i = 0; i < activeList.length; i++) {
    if (DateTime.now().year > activeList[i].year ||
        DateTime.now().month > activeList[i].month ||
        DateTime.now().day > activeList[i].day) {
      activeList.removeAt(i);
    }
  }
  return activeList;
}

List<DateTime> unactiveDateTimeList = getFilteredDates(
  DateTime(2024, 10, 1),
  DateTime(2024, 10, 31),
);

List<Noti> notifications = [
  Noti(
    title: 'Meet with Doctor Stephen Strange',
    subTitle: 'The appointment will be started at 10:00 tomorrow.',
    isRead: false,
  ),
  Noti(
    title: 'Maintain system',
    subTitle: 'In 14-10-2024, we will maintain our system for 1 day',
    isRead: true,
  ),
  Noti(
    title: 'Dr.Edward has declined your request',
    subTitle: 'Dr.Edward has declined your request for being in hospital that day',
    isRead: true,
  ),
  Noti(
    title: 'Review Dr.Stephen',
    subTitle: 'Had an excellent appointment? Give Dr.Stephen 5 stars now!',
    isRead: false,
  ),
  Noti(
    title: 'Dr.Stranges has agreed your request',
    subTitle: 'Click for information due date meet in someday',
    isRead: false,
  ),
];
