import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TextIcons extends StatelessWidget {
  final Function() onPressed;
  final IconData textIcon;
   double? sizeOfIcon;
    TextIcons({Key? key,
    required this.onPressed,
    required this.textIcon,
     this.sizeOfIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed,
      icon:  Icon(textIcon,
        size: sizeOfIcon,
        color: const Color(0xffb4b9cc),),
      padding: const EdgeInsets.all(0.0),
      constraints: const BoxConstraints(),
    );
  }
}
class TextStyles extends StatelessWidget {
  final String text;
  final Color colorOfText;
  final double size;
  const TextStyles({Key? key, required this.text,
    required this.colorOfText, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style:  TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: colorOfText,
      ),);
  }
}


// ignore: must_be_immutable
class DefaultMaterialButtonWithAnimation extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final IconData buttonIcon;
  const DefaultMaterialButtonWithAnimation({Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape:const StadiumBorder(
        side: BorderSide(color:Color(0xffd8dee8),
          width:1,),
      ),
      elevation: 2,
      height: 50,
      splashColor:Colors.white,
      highlightColor: Colors.white,
      color: Colors.white,
      child: Row(
          children:  [

            Icon(buttonIcon,
                size: 23,
                color: const Color(0xffa7b0d1),),
            const SizedBox(width: 5),
            Text(buttonText,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa7b0d1),
                )),
          ]
      ),);
  }
}

class IconsScreen extends StatelessWidget {
  const IconsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){},
          icon: const Icon(Icons.create_new_folder_outlined, size: 35,color:Color(0xffa7b0d1)),
          splashColor:Colors.white,
          highlightColor: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(onPressed: (){},
          icon: const Icon(Icons.flag_outlined,size: 35,color:Color(0xffa7b0d1)),
          splashColor:Colors.white,
          highlightColor: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Transform.scale(
          scaleX: -1,
          child:IconButton(onPressed: (){},
            icon: const Icon(Icons.brightness_2_outlined,size: 35,color:Color(0xffa7b0d1)),
            splashColor:Colors.white,
            highlightColor: Colors.white,
          ),

        )
      ],
    );
  }
}

// ignore: must_be_immutable
class BoxOfTasks extends StatelessWidget {
  final String numberOfTasks;
  final String categories;
  final double tasks;
  final double maxTasks;
  final Color activeColor;
  final Color inactiveColor;
   BoxOfTasks({Key? key,
     required this.numberOfTasks,
     required this.categories,
    required this.tasks,
    required this.maxTasks,
    required this.activeColor,
    required this.inactiveColor}) : super(key: key);

  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 95,
        decoration:  const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.05,
              offset: Offset(0, 2),
              blurRadius: 3,)]),
        child :Padding(
          padding: const EdgeInsets.all(10.0),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(numberOfTasks,style:const TextStyle(
                fontSize:15 ,
                color:Color(0xffb4b9cc) ,
                fontWeight: FontWeight.w700,
              ),),
              const SizedBox(
                height: 3,
              ),
              Text(categories,style:const TextStyle(
                fontSize:20 ,
                color:Colors .black,
                fontWeight: FontWeight.w700,
              ),),
              const SizedBox(
                height: 10,
              ),
              SliderTheme(
                data: const SliderThemeData(
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0.00001),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius:4),
                ),
                child: Slider(value: tasks,
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    min: 0,
                    max: maxTasks,
                    onChanged: (value){}

                ),
              )



            ],

          ),
        )

    );
  }
}


// ignore: must_be_immutable
class TasksBord extends StatefulWidget {
  final String tasksName;
  final String tasksDate;
  final bool clickColor;
  TasksBord({Key? key,
    required this.tasksName,
    required this.tasksDate,
    required this.clickColor,
  }) : super(key: key);
  double inCircle=3;
  double outCircle=2;
  double widthChange=1;
   @override
   _TasksBordState createState() {
    // TODO: implement createState
    return _TasksBordState();
  }
}
  // ignore: camel_case_types
  class _TasksBordState extends State<TasksBord>{
    bool visibleCircle=false;
    bool checkCircle=true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
          children: [
            Visibility(
              visible: visibleCircle,
              child: AnimatedScale(
                  scale:checkCircle?widget.inCircle:widget.outCircle ,
                  curve: Curves.easeInOutBack,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 20,
                      height: 60,
                      // child: ,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color:widget.clickColor? const Color(0xfff757ff):const Color(0xff006aff),
                            width:widget.widthChange),
                      ),
                    ),
                  )
              ),
            ),
            AbsorbPointer(
              absorbing: !checkCircle,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child:   RawMaterialButton(

                  onPressed: (){
                    setState(() {
                      visibleCircle=!visibleCircle;
                      Future.delayed( const Duration(milliseconds: 0), () {
                        setState(() {
                          checkCircle=!checkCircle;
                        });
                      });
                    });
                    Future.delayed( const Duration(milliseconds: 250), () {
                      setState(() {
                        widget.inCircle=2.5;
                        widget.outCircle=5;
                        widget.widthChange=0.5;
                      });
                    });
                    Future.delayed( const Duration(milliseconds:500 ), () {
                      setState(() {
                        visibleCircle=!visibleCircle;
                      });
                    });
                  },
                  elevation:0,
                  constraints: BoxConstraints.tight(
                      const Size(30, 30)),

                  highlightColor:widget.clickColor? const Color(0xfff757ff).withOpacity(0.7):const Color(0xff006aff).withOpacity(0.7),

                  splashColor: widget.clickColor? const Color(0xfff757ff).withOpacity(0.3):const Color(0xff006aff).withOpacity(0.3),

                  child: checkCircle?null:Icon(Icons.check_circle_rounded,

                      size: 30,

                      color: const Color(0xffb4b9cc).withOpacity(0.7)),

                  focusElevation: 0,

                  shape: CircleBorder(side: BorderSide(

                    width: 4,

                    color: checkCircle?(widget.clickColor?const Color(0xfff757ff):const Color(0xff006aff))
                        :(widget.clickColor?const Color(0xfff757ff).withOpacity(0):const Color(0xff006aff).withOpacity(0)),

                  )),



                ),
              ),
            ),
          ],
        );
  }


   // void delay(){Future.delayed( Duration(milliseconds:2000 ), () {
   //
   // });}
  // @override
  // void paint(Canvas canvas, Size size) {
  //
  //   print("final $circleArea");
  //   final paint =Paint()
  //     ..strokeWidth=5 //this for size od color
  //     ..style= PaintingStyle.stroke // this for the shape of color
  //     ..color=circleColor; // this for color
  //   final center = Offset(size.width/1, size.height/1); // this for center the circle
  //   canvas.drawCircle(center, circleArea.abs(), paint);  // this for make the circle if i want line this will be change
  // }
  //
  // @override
  // bool shouldRepaint(covariant CustomPainter oldDelegate) =>false; // this always be false
  //
} // this class for make circle
// ignore: camel_case_types, must_be_immutable
class circleClick extends StatefulWidget {

  circleClick({Key? key}) : super(key: key);
  double inCircle=3;
  double outCircle=2;
  double widthChange=2;
  bool clickColor=true;

  @override
  _circleClick createState() => _circleClick();
}

// ignore: camel_case_types
class _circleClick extends State<circleClick> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAninmation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    _scaleAninmation=TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
      tween:Tween<double>(begin:0,end:50),
    weight:50
    ),
        TweenSequenceItem<double>(
            tween:Tween<double>(begin:50,end:30),
            weight:50
        ),
        TweenSequenceItem<double>(
            tween:Tween<double>(begin:30,end:90),
            weight:50
        ),
        TweenSequenceItem<double>(
            tween:Tween<double>(begin:90,end:0),
            weight:50
        ),
      ]
    ).animate(_controller);
    _controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
          _controller.reverse();
        });
        if(status==AnimationStatus.dismissed){
          setState(() {
            _controller.forward();
          });
      }
    }});

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: AnimatedBuilder(animation: _controller,
          builder: (BuildContext context,_){
        return Stack(
          children: [
            InkWell(
            onTap:  (){
              _controller.forward();
            },),
            Center(
              child: Container(
                width:_scaleAninmation.value,
                height: _scaleAninmation.value,
                // child: ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color:const Color(0xff006aff),
                      width:5,),
                ),
              ),
            ),

          ],
        );
      }
      ),
    );
  }
}

