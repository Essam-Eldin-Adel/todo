
import 'dart:ui';

import 'package:flutter/material.dart';


 // ignore: must_be_immutable
 class DefualtBoxTime extends StatefulWidget {
  final double width;
  final String textOfBox;
  final bool  clickButton;
  final bool absorbingClick;
  final Function()? onTap;
  const DefualtBoxTime({Key? key,
    required this.width,
    required this.textOfBox,
      required this.clickButton,
    required this.onTap,
     required this.absorbingClick,
  }
  ) : super(key: key);
  @override
  State<DefualtBoxTime> createState() => _DefualtBoxTimeState();
}

class _DefualtBoxTimeState extends State<DefualtBoxTime> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.absorbingClick,
      child: SizedBox(
        width: widget.width,
        height: 40,
        child: ElevatedButton(

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              side:  const BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(30.0),
            ),)
          ),
          child: Text(widget.textOfBox,style: TextStyle(color:widget.clickButton?Colors.blue:Colors.black.withOpacity(0.8),),),
          onPressed: widget.onTap,
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class DefualtBoxAction extends StatefulWidget {
  final double width;
  final String textOfBox;
  final Function()? onTap;
  const DefualtBoxAction({Key? key,
    required this.width,
    required this.textOfBox,
    required this.onTap,
  }
      ) : super(key: key);
  @override
  _DefualtBoxActionState createState() => _DefualtBoxActionState();
}

class _DefualtBoxActionState extends State<DefualtBoxAction> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: widget.width,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                side:  const BorderSide(color: Color(0xff006aff), width: 1),
                borderRadius: BorderRadius.circular(30.0),
              ),)
          ),
          child: Text(widget.textOfBox,style: const TextStyle(color:Color(0xff006aff),)),
          onPressed: widget.onTap,
        ),
    );
  }
}
// ignore: must_be_immutable
class DefualtInkwell extends StatefulWidget {
      final bool chageTime;
      final bool absorbingClick;
      final int boxNumber;
     final Function()? onTap;
   const DefualtInkwell({Key? key,
     required this.chageTime,
     required this.boxNumber,
     required this.absorbingClick,
     required this.onTap,
  }) : super(key: key);

  @override
  State<DefualtInkwell> createState() => DefualtInkwell_State();
}

// ignore: camel_case_types
class DefualtInkwell_State extends State<DefualtInkwell> {
bool change=true;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.absorbingClick,
      child: InkWell(
          onTap: widget.onTap,
          child:Text(widget.boxNumber<10?'0${widget.boxNumber.round()}':'${widget.boxNumber.round()}'
              ,style:  TextStyle(
                fontSize: 50,
                color:widget.chageTime?Colors.blue:Colors.black87,
              )
          )
      ),
    );
  }
}
class BoolController extends ValueNotifier<bool>{
  BoolController(bool value) : super(value);
  void complementValue(){
    value=!value;
  }
}

class DefualtComma extends StatelessWidget {
   final bool changComma;
  const DefualtComma({Key? key,
  required this.changComma
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(changComma? ':':'|',
      style:  TextStyle(fontSize: changComma? 60:50,
        color: changComma? Colors.black:const Color(0xff006aff)
      ),
    );
  }
}

// ignore: camel_case_types
class drawCurve extends StatefulWidget {
  const drawCurve({Key? key}) : super(key: key);

  @override
  State<drawCurve> createState() => drawCurve_State();
}

  // ignore: camel_case_types
  class drawCurve_State extends State<drawCurve> {
  @override
  Widget build(BuildContext context) {
  // ignore: null_check_always_fails
  return null!;
  }
  Path drawPath() {
  Size size = const Size(300, 300);
  Path path = Path();

  path.moveTo(0, size.height *0.30);
  path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
  path.quadraticBezierTo(
  size.width * 3 / 4, 0, size.width*0.9, size.height / 4);
  return path;
  }
  Offset calculate(value,path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}




