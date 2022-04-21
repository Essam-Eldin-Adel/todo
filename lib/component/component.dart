import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultFormField extends StatelessWidget {
  final TextInputType keyBordType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate ;
  final String text;
  final Color boxColor;
  final Color textColor;
  final Color sideColor;
  // ignore: non_constant_identifier_names
  final double Raduis;
  IconData? suf;
  Function()? tap;
  Function(String)? submit;
  Function(String)? change;
  IconData? pref;
  Color? prefixColor;
  DefaultFormField({Key? key,
    required this.controller,
    required this.keyBordType,
    required this.validate,
    required this.text,
    this.pref,
    required this.textColor,
    this.prefixColor,
    required this.boxColor,
    required this.sideColor,
    // ignore: non_constant_identifier_names
    required this.Raduis,
    this.suf,
    this.tap,
    this.submit,
    this.change,
  }) : super(key: key);
  bool checkVisible= true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: checkVisible,
      child: TextFormField(
        style: const TextStyle(
            fontSize: 27
        ),
        controller: controller,
        keyboardType: keyBordType,
        onTap: tap,
        onFieldSubmitted: submit,
        onChanged: change,
        validator: validate,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
          hintText: text,
          hintStyle: TextStyle(color: textColor,
              fontSize: 27,
              fontWeight: FontWeight.w400),
          fillColor: boxColor,
          filled: true,
          prefix: Icon(pref,
            color: prefixColor,),
          suffix: Icon(suf),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
            borderRadius: BorderRadius.circular(Raduis),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.circular(Raduis)
          ),


        ),

      ),
    );
  }
}

// ignore: must_be_immutable
class DefaultMaterialButton extends StatelessWidget {
  final ShapeBorder buttonShape;
  final Function() onPressed;
  final double buttonWidth;
  final Color buttonColor;
  final String buttonText;
  final double textSize;
  final Color textColor;
  final IconData buttonIcon;
  final double iconSize;
  final Color iconColor;
  FontWeight? textWeight;
   DefaultMaterialButton({Key? key,
     required this.buttonShape,
     required this.onPressed,
     required this.buttonWidth,
     required this.buttonColor,
     required this.buttonText,
     required this.textSize,
     required this.textColor,
     required this.buttonIcon,
     required this.iconSize,
     required this.iconColor,
     this.textWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: buttonShape,
      focusElevation: 0,
      autofocus: true,
      height: 50,
      minWidth: buttonWidth,
      color: buttonColor,
      child: Row(
        children:  [
          Text(buttonText,
              style: TextStyle(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor
          )),
          const SizedBox(width: 10),
          Icon(buttonIcon,
            size: iconSize,
            color: iconColor),
        ]
      ),);
  }
}

class DefaultMaterialButtonWithAnimation extends StatelessWidget {
  final ShapeBorder buttonShape;
  final Function() onPressed;
  final double buttonWidth;
  final Color buttonColor;
  final String buttonText;
  final double textSize;
  final Color textColor;
  final IconData buttonIcon;
  final double iconSize;
  final Color iconColor;
  FontWeight? textWeight;
  DefaultMaterialButtonWithAnimation({Key? key,
    required this.buttonShape,
    required this.onPressed,
    required this.buttonWidth,
    required this.buttonColor,
    required this.buttonText,
    required this.textSize,
    required this.textColor,
    required this.buttonIcon,
    required this.iconSize,
    required this.iconColor,
    this.textWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: buttonShape,
      focusElevation: 0,
      autofocus: true,
      height: 50,
      minWidth: buttonWidth,
      color: buttonColor,
      child: Row(
          children:  [
            Text(buttonText,
                style: TextStyle(
                    fontSize: textSize,
                    fontWeight: textWeight,
                    color: textColor
                )),
            const SizedBox(width: 10),
            Icon(buttonIcon,
                size: iconSize,
                color: iconColor),
          ]
      ),);
  }
}


Widget box({
  required String numberOfTasks,
  required String categories,
  FontWeight? taskBold,
  required Color taskColor,
  required double taskSize,
  FontWeight? cateBold,
  required Color cateColor,
  required double cateSize,
  required double tasks,
  required double maxTasks,
  required Color activeColor,
  required Color inactiveColor,
})=>Container(
  width: 200,
height: 90,
decoration: const BoxDecoration(
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
    Text(numberOfTasks,style:TextStyle(

      fontSize:taskSize ,

      color:taskColor ,

      fontWeight: taskBold,

    ),),
    const SizedBox(

      height: 3,

    ),
    Text(categories,style:TextStyle(

      fontSize:cateSize ,

      color:cateColor ,

      fontWeight: cateBold,

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
                        border: Border.all(color:widget.clickColor? const Color(0xfff757ff):Colors.blue,
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

                  highlightColor:widget.clickColor? const Color(0xfff757ff).withOpacity(0.7):Colors.blue.withOpacity(0.7),

                  splashColor: widget.clickColor? const Color(0xfff757ff).withOpacity(0.3):Colors.blue.withOpacity(0.3),

                  child: checkCircle?null:Icon(Icons.check_circle_rounded,

                      size: 30,

                      color: const Color(0xffb4b9cc).withOpacity(0.7)),

                  focusElevation: 0,

                  shape: CircleBorder(side: BorderSide(

                    width: 4,

                    color: checkCircle?(widget.clickColor?const Color(0xfff757ff):Colors.blue)
                        :(widget.clickColor?const Color(0xfff757ff).withOpacity(0):Colors.blue.withOpacity(0)),

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
class circleClick extends StatefulWidget {

  circleClick({Key? key}) : super(key: key);
  double inCircle=3;
  double outCircle=2;
  double widthChange=2;
  bool clickColor=true;

  @override
  _circleClick createState() => _circleClick();
}

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
              print('f');
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
                  border: Border.all(color:Colors.blue,
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

