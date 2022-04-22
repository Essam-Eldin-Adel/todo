import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/shared/cubit/states.dart';

import '../../Timer/timercomponent.dart';

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
