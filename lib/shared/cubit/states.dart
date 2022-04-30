
abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppMenuState extends AppStates{
  AppMenuState(bool isMenu);
}
class AppenuState extends AppStates{
  AppenuState(bool visible);
}
class OpenTasksScreenState extends AppStates{}
class ReturnCircleState extends AppStates{}
class EndOfCircleState extends AppStates{}

abstract class CalendarStates{}
class CalendarInitialState extends CalendarStates{}
class ChangeMonthsPlusState extends CalendarStates{}
class ChangeMonthsMinusState extends CalendarStates{}
class ChangeCurrentMonthsState extends CalendarStates{}



// ignore: camel_case_types

abstract class SunAndMoonStates{}
class SunAnaMoonInitialState extends SunAndMoonStates{}
class DayTimerState extends SunAndMoonStates{}
class HoursTimerState extends SunAndMoonStates{}
class AppTimerState extends SunAndMoonStates{}
class AnimationTimerState extends SunAndMoonStates{

  AnimationTimerState();
}

