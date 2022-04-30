import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/shared/cubit/states.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
import '../../Timer/timercomponent.dart';
import '../../celender/calsulate-celander.dart';

const List<double> listOfPosition = [
  0,
  0.041667,
  0.083334,
  0.125,
  0.16667,
  0.2083,
  0.25,
  0.29166,
  0.3333,
  0.375,
  0.4166,
  0.45833,
  0.5,
  0.54166,
  0.5833,
  0.625,
  0.6666,
  0.70833,
  0.75,
  0.79166,
  0.8333,
  0.875,
  0.91666,
  0.95833,
  1
];

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isMenu = true;
  bool visible = true;

  void menuChange() {
    isMenu = !isMenu; //this will toggle so i can click the button
    emit(AppMenuState(isMenu));
  }

  void circle() {
    visible = !visible; //this will toggle so i can click the button
    emit(AppenuState(visible));
  }
  //
  //  void onclick() {
  //    click = !click; // this for circle check
  //    clickCircle = !clickCircle; //this for circle around circle check
  //    emit(AppOnclickState(click, clickCircle));
  //
  //    } // this void for circle check and circle around it
  // void circleChange(){
  //         emit(AppCircleState());
  //   }
  //   void visibleCircle(){
  //     Future.delayed(const Duration(milliseconds:250 ), () {
  //       visibleCircle=!visibleCircle;
  //      emit(AppVisibleCircle());
  //      print('Done');
  //     });
  //   }

  double circleScale=1.2;
  double duration=300;
  Color circleColor=const Color(0xff006aff);
// ignore: non_constant_identifier_names
void OpenTasksScreen(){
  circleScale=40;
  circleColor=Colors.white;
  emit(OpenTasksScreenState());
}
  // ignore: non_constant_identifier_names
  void ReturnCircle(){
    circleScale=1.2;
    duration=1000;
    emit(ReturnCircleState());
  }
  // ignore: non_constant_identifier_names
  void EndOfCircle(){
  duration=300;
  circleColor=const Color(0xff006aff);
  emit(EndOfCircleState());
  }
}

class CalendarCubit extends Cubit<CalendarStates> {
  CalendarCubit() : super(CalendarInitialState());
  static CalendarCubit get(context) => BlocProvider.of(context);
  late var calendar=CalculateCalender();
  late List<String> nameOfDays =  calendar.nameOfDays;
  late List<String> months = calendar.months;
  bool absorbOfArrow=true;
  int lastValue=0;
  List<Color> colorOfCircle=List.generate(42,(count)=>Colors.white);
  void changeMonthsPlus(){
    absorbOfArrow=false;
    if(calendar.monthChange==11){
      calendar.monthChange=0;
      calendar.year=(int.parse(calendar.year)+1).toString();
    }
    else{
      calendar.monthChange++;
    }
    emit(ChangeMonthsPlusState());
  }
  void changeMonthsMinus(){
    if(calendar.monthChange==0){
      calendar.monthChange=11;
      calendar.year=(int.parse(calendar.year)-1).toString();
    }
    else{
      calendar.monthChange--;
    }
    if(calendar.monthChange<(int.parse(calendar.month))&&calendar.year== DateFormat('yyyy').format(DateTime.now()))
    {

        if (lastValue < (calendar.ReturnList()[2]+calendar.day)) {
          colorOfCircle[lastValue] = Colors.white;
        }
        print(calendar.ReturnList()[2]+calendar.day);
      absorbOfArrow=true;
    }
    emit(ChangeMonthsMinusState());
  }
  // ignore: non_constant_identifier_names
  bool ClickButtonAbsorbing(int index) {
    bool clickButton=false;

  if(calendar.monthChange==(int.parse(calendar.month)-1)&&calendar.year== DateFormat('yyyy').format(DateTime.now()))
    {
     if(index<(calendar.day+calendar.CalculateDay())-1)
       {
      clickButton=true;}
    }
    return clickButton;
  }
  // ignore: non_constant_identifier_names
  void ClickButton(int index){
      {
        if(index<calendar.CalculateDay())
        {
          changeMonthsMinus();

        }
        else if(index>=calendar.CalculateDay()&&index<(calendar.listOfDayOfCurrentMonth.length+calendar.CalculateDay()))
            {

              colorOfCircle[lastValue]=Colors.white;
              colorOfCircle[index]=Colors.blue;
              emit(ChangeCurrentMonthsState());
            }
        else
          {
            changeMonthsPlus();
          }
        lastValue=index;
      }
  }
}

class SunAndMoonCubit extends Cubit<SunAndMoonStates> {
  SunAndMoonCubit() : super(SunAnaMoonInitialState());
  static SunAndMoonCubit get(context) => BlocProvider.of(context);
  bool changBool = true;
  bool absorbingClickButton = true;
  bool dayChangeButton = true;
  void changeDayTime() {
    dayChangeButton = !dayChangeButton;
    absorbingClickButton = !absorbingClickButton;
    emit(DayTimerState());
  }

  bool chageTime = true;
  bool absorbingClickWatch = true;
  bool changeTimeButton = true;
  int hourNumber = 12;
  int minuteNumber = 39;
  void toggleTime() {
    changeTimeButton = !changeTimeButton;
    absorbingClickWatch = !absorbingClickWatch;
    chageTime = !chageTime;
    emit(HoursTimerState());
  }

  late AnimationController controller;
  late Animation<double> scaleAnimationX;
  late Animation<double> scaleAnimationY;
  late Animation<double> scaleAnimationZ;
  Path path = drawCurve_State().drawPath();

  void initializeAnimation({required AnimationController widgetController}) {
    print("init");
    controller = widgetController;
    print(widgetController);
    print(controller);

    scaleAnimationX = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: changBool ? 0 : listOfPosition[hourNumber],
              end: changBool ? 1 : listOfPosition[hourNumber]),
          weight: 50),
    ]).animate(controller);
    scaleAnimationY = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: changBool ? 0 : listOfPosition[hourNumber],
              end: changBool ? 1 : listOfPosition[hourNumber]),
          weight: 50),
    ]).animate(controller);
    scaleAnimationZ = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: changBool
                  ? 0
                  : drawCurve_State().calculate(scaleAnimationY.value, path).dy,
              end: 150),
          weight: 50),
    ]).animate(controller);

    controller.forward();
  }

  void sliderChange(int sliderPosition) {
    if (chageTime) {
      hourNumber = sliderPosition;
      changeState();
    } else {
      minuteNumber = sliderPosition;
      changeState();
    }
  }

  void changeState() {
    changBool = false;
    print(controller.status);
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }

    emit(AnimationTimerState());
  }
}
