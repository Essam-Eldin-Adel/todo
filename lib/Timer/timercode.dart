import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/Timer/timercomponent.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import 'final code of timer of day.dart';

// ignore: must_be_immutable
class AnimatedContainerApp1 extends StatelessWidget {
  BoolController clickButton = BoolController(false);
  final bool isClick;

  AnimatedContainerApp1({Key? key, required this.isClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SunAndMoonCubit(),
        child: BlocConsumer<SunAndMoonCubit, SunAndMoonStates>(
            listener: (BuildContext context, SunAndMoonStates state) {},
            builder: (BuildContext context, SunAndMoonStates state) {
              SunAndMoonCubit cubit = SunAndMoonCubit.get(context);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      const SunAndMoon(),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Container(
                          width: 350,
                          // widget.isClick?0:
                          height: 300,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefualtBoxTime(
                                        width: 54,
                                        textOfBox: 'AM',
                                        clickButton: cubit.dayChangeButton,
                                        absorbingClick:
                                            cubit.absorbingClickButton,
                                        onTap: () {
                                          cubit.changeDayTime();
                                        }),
                                    const SizedBox(width: 17),
                                    DefualtBoxTime(
                                      width: 54,
                                      textOfBox: 'PM',
                                      clickButton: !cubit.dayChangeButton,
                                      absorbingClick:
                                          !cubit.absorbingClickButton,
                                      onTap: () {
                                        cubit.changeDayTime();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefualtInkwell(
                                        chageTime: cubit.changeTimeButton,
                                        boxNumber: cubit.hourNumber,
                                        absorbingClick:
                                            cubit.absorbingClickWatch,
                                        onTap: () {
                                          cubit.toggleTime();
                                        }),
                                    const DefualtComma(changComma: true),
                                    DefualtInkwell(
                                        chageTime: !cubit.changeTimeButton,
                                        boxNumber: cubit.minuteNumber,
                                        absorbingClick:
                                            !cubit.absorbingClickWatch,
                                        onTap: () {
                                          cubit.toggleTime();
                                        }),
                                  ],
                                ),
                                SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      trackHeight: 1,
                                    ),
                                    child: Slider(
                                      value: cubit.chageTime
                                          ? cubit.hourNumber.toDouble()
                                          : cubit.minuteNumber.toDouble(),
                                      onChanged: (value) {
                                        cubit.sliderChange(value.toInt());
                                      },
                                      min: cubit.chageTime ? 1 : 0,
                                      max: cubit.chageTime ? 12 : 59,
                                      activeColor: Colors.red,
                                      divisions: cubit.chageTime ? 11 : 58,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefualtBoxAction(
                                        width: 100,
                                        textOfBox: 'Cancel',
                                        onTap: () {}),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const DefualtComma(changComma: false),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    DefualtBoxAction(
                                        width: 100,
                                        textOfBox: 'Done',
                                        onTap: () {}),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
