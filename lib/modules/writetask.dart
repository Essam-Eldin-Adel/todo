import 'package:flutter/material.dart';
import 'package:todoapp_version2/component/component.dart';
import 'package:todoapp_version2/component/constant.dart';
import 'package:todoapp_version2/component/icons.dart';

import '../Timer/timercode.dart';
import '../component/task.dart';
import '../Timer/time.dart';

class WriteTasks extends StatefulWidget {
  const WriteTasks({Key? key}) : super(key: key);
  @override
  State<WriteTasks> createState() => WriteTasks_State();
}

// ignore: camel_case_types
class WriteTasks_State extends State<WriteTasks> {
  var textcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool itsClick = true;
  bool changeTaskForm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.black87,
                        ),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DefaultFormField(
                      sideColor: Colors.grey,
                      Raduis: 5.5,
                      textColor: const Color(0xffa7b0d1),
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'You must enter the task';
                        }
                        return null;
                      },
                      keyBordType: TextInputType.text,
                      text: 'Enter new task',
                      controller: textcontroller,
                      boxColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      DefaultMaterialButtonWithAnimation(
                        buttonWidth: 130,
                        buttonShape: const StadiumBorder(
                          side: BorderSide(
                            color: Color(0xffd8dee8),
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            itsClick = !itsClick;
                          });
                        },
                        buttonColor: Colors.white,
                        buttonText: 'Today',
                        textSize: 19,
                        textColor: const Color(0xffa7b0d1),
                        textWeight: FontWeight.bold,
                        buttonIcon: Icons.calendar_today_outlined,
                        iconColor: const Color(0xffa7b0d1),
                        iconSize: 25,
                      ),
                      const BoxSized1(),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.6),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: changeTaskForm
                                      ? Colors.blue
                                      : const Color(0xfff757ff),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: const Color(0xffd8dee8),
                                  width: 2,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    changeTaskForm = !changeTaskForm;
                                  });
                                },
                                icon: Icon(
                                  Icons.circle,
                                  color: changeTaskForm
                                      ? Colors.blue
                                      : const Color(0xfff757ff),
                                  size: 17,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(82.0),
                //   child: IconsScreen(),
                // ),
                const SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DefaultMaterialButton(
                    buttonWidth: 50,
                    buttonColor: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60.0))),
                    buttonText: 'New task',
                    textSize: 19,
                    textColor: Colors.white,
                    textWeight: FontWeight.bold,
                    buttonIcon: Icons.keyboard_arrow_up,
                    iconColor: Colors.white,
                    iconSize: 25,
                  ),
                ]),
              ],
            ),
          ),
          Center(child: AnimatedContainerApp1(isClick: itsClick)),
        ],
      ),
    );
  }
}
