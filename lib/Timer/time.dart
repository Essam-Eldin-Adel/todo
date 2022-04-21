// import 'package:flutter/material.dart';
// import 'package:todoapp_version2/Timer/timercomponent.dart';
// import '../component/constant.dart';
//
// // ignore: must_be_immutable
// class AnimatedContainerApp1 extends StatefulWidget {
//    bool isClick=true;
//     AnimatedContainerApp1({Key? key,
//      required this.isClick,
//   }) : super(key: key);
//
//   @override
//   _AnimatedContainerApp1State createState() => _AnimatedContainerApp1State();
// }
//
// class _AnimatedContainerApp1State extends State<AnimatedContainerApp1> {
//   // Define the various properties with default values. Update these properties
//   // when the user taps a FloatingActionButton.
//   Color color = Colors.white;
//   double hourNumber=7;
//   double minuteNumber=39;
//   bool chageTime=true;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//             // Use the properties stored in the State class.
//             width: widget.isClick?0:350,
//             height:widget.isClick?0:400,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   spreadRadius: 1,
//                   blurRadius: 2,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             // Define how long the animation should take.
//             duration: const Duration(milliseconds: 500),
//             // Provide an optional curve to make the animation feel smoother.
//             curve: Curves.fastOutSlowIn,
//         child: SingleChildScrollView(
//           child: Column(
//             children:  [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 40,
//                       decoration:  BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         border: Border.all(color:Colors.blue,
//                             width:2),
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black12,
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: TextButton(onPressed: () {
//                         setState(() {
//                           chageTime=true;
//                         });
//                       },
//                       child: const Text('AM'),),
//                     ),
//                     const BoxSized1(),
//                     Container(
//                       width: 50,
//                       height: 40,
//                       decoration:  BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         border: Border.all(color:Colors.blue,
//                             width:2),
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black12,
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: TextButton(onPressed: () {
//                         setState(() {
//                           chageTime=false;
//                         });
//                       },
//                         child: const Text('PM'),),
//                     ),
//                   ],
//                 ),
//               ),
//       const SizedBox(
//         height: 20,
//       ),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const DefualtInkwell(),
//                   DefualtBox(width: 100, textOfBox: 'PM',),
//                 ],
//               )),
//               SliderTheme(
//                 data: SliderTheme.of(context).copyWith(
//                   trackHeight: 1,
//                 ),
//                 child: Slider(
//                 value: chageTime?hourNumber:minuteNumber,
//                 onChanged: (value) {
//                   if(chageTime){
//                   setState(() {
//                     hourNumber = value;
//                   });}
//                   else{
//                     setState(() {
//                       minuteNumber= value;
//                     });
//                   }
//                 },
//                 min: 1,
//                 max: chageTime?12:60,
//                 activeColor: Colors.blue,
//                 divisions: chageTime?11:59,
//               )
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 40),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 40,
//                         decoration:  BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border: Border.all(color:Colors.blue,
//                               width:2),
//                           color: Colors.white,
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: TextButton(onPressed: () {
//                           setState(() {
//                             chageTime=true;
//                           });
//                         },
//                           child: const Text('Cancel'),),
//                       ),
//                       SizedBox(
//                         width: 35,
//                       ),
//                       Text('|',style: TextStyle(fontSize: 50,color:Colors.blue ),),
//                       SizedBox(
//                         width: 35,
//                       ),
//                       Container(
//                         width: 100,
//                         height: 40,
//                         decoration:  BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border: Border.all(color:Colors.blue,
//                               width:2),
//                           color: Colors.white,
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: TextButton(onPressed: () {
//                           setState(() {
//                             chageTime=true;
//                           });
//                         },
//                           child: const Text('Done'),),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//       ),
//         ),
//     );
//   }
// }
//
