import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerApp extends StatefulWidget {

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();

}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _height = 200;
  bool absorb=false;
  bool checkTask=false;
  bool visibleCircle=true;
  bool checkCircle=true;
  double inCircle=3;
  double outCircle=2;
  double widthChange=2;

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: AnimatedContainer(
            // Use the properties stored in the State class.
            width: double.infinity,
            height: _height,
            decoration: BoxDecoration(color: checkCircle?Colors.white:Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0.05,
                  offset: Offset(0, 2),
                  blurRadius: 3,)]
            ),
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
        child:
            Stack(
              children: [
                ListTile(
                  trailing: Text('essam',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: checkCircle?FontWeight.w500:FontWeight.w400,
                    ),
                  ),
                  title: Text('2356',
                      style: TextStyle(
                        fontSize: 20,
                        color: checkCircle?Colors.black:Colors.black.withOpacity(0.90),
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        decoration: checkCircle?TextDecoration.none:TextDecoration.lineThrough,
                      )),
                  contentPadding:const EdgeInsets.only(
                      right: 15,
                      left: 0) ,
                ),
                Visibility(
                  visible: !checkTask,
                  child: AbsorbPointer(
                    absorbing: absorb,
                    child: InkWell(
                      // When the user taps the button
                      onTap: () {
                        // Use setState to rebuild the widget with new values.
                        setState(() {
                          absorb=!absorb;
                          _height = checkTask?200:55;
                          checkTask=!checkTask;
                        });
                      },
    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}


