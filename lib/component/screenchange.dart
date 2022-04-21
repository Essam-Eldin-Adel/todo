import 'package:flutter/material.dart';
import '../modules/writetask.dart';
// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class ScreenChange extends StatefulWidget {
  const ScreenChange({Key? key}) : super(key: key);

  @override
  _ScreenChangeState createState() => _ScreenChangeState();
}
// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _ScreenChangeState extends State<ScreenChange> {
  // Whether the green box should be visible
  bool checkCircle=true;
  double startCircle=1.2;
  double endCircle=28;
  bool circle = true;
  var duration=300;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child:  AnimatedScale(
              duration:  Duration(milliseconds: duration),
              // The green box must be a child of the AnimatedOpacity widget.
              scale: checkCircle?(circle?startCircle:endCircle):(circle?endCircle:startCircle),
              child: FloatingActionButton(onPressed: (){
                setState(() {
                  duration=300;
                  checkCircle=!checkCircle;
                });
                Future.delayed( const Duration(milliseconds:300 ), () {
                   setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  WriteTasks()));
                        });
                });
                Future.delayed( const Duration(milliseconds:700 ), () {
                  setState(() {
                    checkCircle=!checkCircle;
                    duration=0;
                  });
                });

              },
              child: Icon(checkCircle?(circle?Icons.add:Icons.circle):(circle?Icons.circle:Icons.add),
              color: Colors.white,),
                backgroundColor:checkCircle?(circle? Colors.blue:Colors.white): (circle?Colors.white:Colors.blue),
            focusColor: Colors.white,
                hoverColor: Colors.white,
                foregroundColor: Colors.white,
                splashColor: Colors.white,
                autofocus: false,
              ),
          ),
    );
  }
}

