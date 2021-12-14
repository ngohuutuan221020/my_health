import 'package:suc_khoe_app/components/bottom_button.dart';
import 'package:suc_khoe_app/design_course/covid_19.dart';
import 'package:suc_khoe_app/fitness_app/fitness_app_home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:suc_khoe_app/introduction_animation/introduction_animation_screen.dart';
import 'package:suc_khoe_app/screens/calculator_screen.dart';
import 'package:suc_khoe_app/screens/result_screen.dart';
import 'package:suc_khoe_app/utils/calculate_bmi.dart';
import '../scrapingCovid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeList {
  HomeList({

    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/fitness_app/suckhoe.jpg',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/images/chart.jpg',
      navigateScreen: CalculatorScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/covid.jpg',
      navigateScreen: covidScreen(),
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/thugian.jpg',
      navigateScreen: IntroductionAnimationScreen(),
    ),
  ];
}
