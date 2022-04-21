import 'dart:ui';

import 'package:flutter/animation.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppMenuState extends AppStates{
  AppMenuState(bool isMenu);
}
class AppenuState extends AppStates{
  AppenuState(bool visible);
}
// ignore: camel_case_types

abstract class SunAndMoonStates{}
class SunAnaMoonInitialState extends SunAndMoonStates{}
class DayTimerState extends SunAndMoonStates{}
class HoursTimerState extends SunAndMoonStates{}
class AppTimerState extends SunAndMoonStates{}
class AnimationTimerState extends SunAndMoonStates{

  AnimationTimerState();
}

