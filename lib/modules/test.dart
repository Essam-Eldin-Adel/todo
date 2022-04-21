//
//
// import 'package:flutter/material.dart';
//
// import '../Timer/timercomponent.dart';
//
// // ignore: must_be_immutable
// class SunAndMoon extends StatefulWidget {
//   double changePosition;
//   SunAndMoon({Key? key,
//     required this.changePosition})
//       : super(key: key);
//   late List<double> listOfPosition=[0,0.041667,0.083334,0.125,0.16667,0.2083,0.25,0.29166,0.3333,0.375,
//     0.4166,0.45833,0.5,0.54166,0.5833,0.625,0.6666,0.70833,0.75,0.79166,0.8333,0.875,0.91666,0.95833,1];
//   double initialState=0;
//   @override
//   State<SunAndMoon> createState() => SunAndMoon_State();
// }
//
// // ignore: camel_case_types
// class SunAndMoon_State extends State<SunAndMoon> with TickerProviderStateMixin {
//   double hourNumber = 7;
//   double minuteNumber = 39;
//   bool chageTime = true;
//   bool changBool =false;
//   bool changState =false;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimationX;
//   late Animation<double> _scaleAnimationY;
//   late Animation<double> _scaleAnimationZ;
//   late Animation<double> _scaleAnimationW;
//   late Animation<Color?> _colorAnimation;
//   late Path _path;
//   //  loop(int value){
//   //   double sum=0;
//   //   for(int i=0 ; i<24;i++){
//   //     widget.listOfPosition[i]=sum ;
//   //     sum=sum+0.5;
//   // }
//   //   return widget.listOfPosition[value];
//   // }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = AnimationController(
//         duration: changBool?Duration(milliseconds: 300):Duration(seconds: 3),
//         vsync: this);
//     _scaleAnimationY = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: widget.listOfPosition[hourNumber.toInt()],
//                   end: widget.listOfPosition[hourNumber.toInt()]),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationX = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: widget.listOfPosition[hourNumber.toInt()],
//                   end: widget.listOfPosition[hourNumber.toInt()]),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationZ = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: 0,
//                   end: 1),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationW = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: 0,
//                   end:0),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     print(widget.changePosition);
//     _controller.forward();
//     _path  = drawCurve_State(change: hourNumber).drawPath();
//   }
//
//   changeState(double value) {
//     _controller = AnimationController(
//         duration: changBool?Duration(seconds: 1):Duration(seconds: 3),
//         vsync: this);
//     _scaleAnimationY = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: widget.listOfPosition[value.toInt()],
//                   end: widget.listOfPosition[value.toInt()]),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationX = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: widget.listOfPosition[value.toInt()],
//                   end: widget.listOfPosition[value.toInt()]),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationZ = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: 0.5,
//                   end: 1),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _scaleAnimationW = TweenSequence(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//               tween: Tween<double>(
//                   begin: 0.5,
//                   end:0.5),
//               weight: 50
//           ),
//         ]
//     ).animate(_controller);
//     _colorAnimation=TweenSequence<Color?>([
//       TweenSequenceItem(
//         weight: 1.0,
//         tween: ColorTween(begin: Colors.red, end: Colors.blue),
//       )
//     ]).animate(_controller);
//     _controller.forward();
//     _controller.addStatusListener((status) {
//       if(status==AnimationStatus.completed){
//         if (hourNumber==12){
//           _controller.reverse();}
//       }});
//
//
//     _path  = drawCurve_State(change: hourNumber).drawPath();
//
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(animation: _controller,
//         builder: (BuildContext context, _) {
//           return Stack(
//               children: [
//                 Positioned(
//                   top: changBool?drawCurve_State(change: hourNumber).calculate( _scaleAnimationZ.value,_path).dy:drawCurve_State(change: hourNumber).calculate( _scaleAnimationY.value,_path).dy,
//                   left:changBool?drawCurve_State(change: hourNumber).calculate( _scaleAnimationW.value,_path).dx:drawCurve_State(change: hourNumber).calculate( _scaleAnimationX.value,_path).dx,
//
//           child:changState?const Image(
//                     image: AssetImage(
//                         'images/—Pngtree—beautiful night glowing moon_5336574.png'),
//                     height: 60,
//                     width: 60,
//                   ):const Image(
//                     image: AssetImage(
//                         'images/—Pngtree—universe starry sky sky sun_3924608.png'),
//                     height: 60,
//                     width: 60,
//                   ),
//                 ),
//                 CustomPaint(
//                   painter: PathPainter(_path),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 130),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 40),
//                       child: SliderTheme(
//                           data: SliderTheme.of(context).copyWith(
//                             trackHeight: 1,
//                           ),
//                           child: Slider(
//                             value: chageTime
//                                 ? hourNumber
//                                 : minuteNumber,
//                             onChanged: (value) {
//                               if(value==12){
//                               changBool=true;}
//                               else{
//                                 changBool=false;
//                               }
//                               if(value>12){
//                                 changState=true;}
//                               else{
//                                 changState=false;
//                               }
//                               if (chageTime) {
//                                 setState(() {
//                                   changeState(value);
//                                   hourNumber = value;
//                                   print(hourNumber);
//                                 });
//                               }
//                               else {
//                                 setState(() {
//                                   minuteNumber = value;
//                                 });
//                               }
//
//                             },
//                             min: 1,
//                             max: chageTime ? 24 : 60,
//                             activeColor: Colors.blue,
//                             divisions: chageTime ? 23 : 59,
//                           )
//                       ),
//                     ),
//                   ),
//                 ),
//               ]
//           );
//         }
//     );
//   }
// }
//
//
// class PathPainter extends CustomPainter {
//
//   Path path;
//
//   PathPainter(this.path);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.redAccent.withOpacity(0.3)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }