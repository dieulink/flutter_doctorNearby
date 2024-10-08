import 'package:flutter/material.dart';
import 'package:flutter_doctor_nearby/models/disease.dart';

// color
const primaryColor = Color(0xff0D53FC);
const lightBlue = Color(0xff53A1FD);
const extraLightBlue = Color(0xff96B5FF);
const lightGrey = Color(0xffCFD6E7);
const greyColor = Color(0xffDEDEDE);
const redColor = Color(0xffFE4E4E);
const lightRed = Color(0xffE8505B);
const greenColor = Color(0xff2FCB82);
const greyContent = Color(0xffAAAAAA);

// images
const avtSample = 'assets/images/avt_sample.jpg';
const doctorAvt = 'assets/images/doctor_avt.png';

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

// number
const defaultMargin = 8.0;
const defaulPagePadding = EdgeInsets.all(16.0);
const borderRadius = 10.0;

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
