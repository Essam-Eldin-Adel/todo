//
// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:intl/intl.dart';
// import '../Timer/timercomponent.dart';
// import 'constant_of_celender.dart';
// // ignore: import_of_legacy_library_into_null_safe
//
// class HomeCalendarPage extends StatefulWidget {
//   const HomeCalendarPage({Key? key}) : super(key: key);
//
//   @override
//   _HomeCalendarPageState createState() => _HomeCalendarPageState();
// }
//
// class _HomeCalendarPageState extends State<HomeCalendarPage> {
//   final colorOfClick = List<Color>.generate(42,(counter) => Colors.white);
//   String year= DateFormat('yyyy').format(DateTime.now());
//   String month= DateFormat('MM').format(DateTime.now());
//   late int monthChange=(int.parse(month))-1;
//   String today= DateFormat('d').format(DateTime.now());
//   late int  day=(int.parse(today))-1;
//   bool absorbOfArrow=true;
//   bool checkClicked=true;
//
//   @override
//   Widget build(BuildContext context) {
//     late var acl=CalculateCalender(year: (int.parse(year)), month:monthChange);
//     return  Padding(
//       padding: const EdgeInsets.symmetric(vertical: 100),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           width: double.infinity,
//           // widget.isClick?0:
//           height: 500,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 spreadRadius: 5,
//                 blurRadius: 5,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 80,
//                     decoration: const BoxDecoration(
//                       color: Color(0xff006aff),
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20)),
//                     ),
//                     child:  Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.baseline,
//                         textBaseline: TextBaseline.alphabetic,
//                         children:  [
//                           Expanded(
//                               child: IconButton(icon:  Icon(Icons.arrow_back_ios_outlined,
//                                 color: absorbOfArrow?Colors.white38:Colors.white,
//                               size:30 ,),
//                                 onPressed: () {
//                                 print(day);
//                                 setState(() {
//                                   if(monthChange<(int.parse(month))&&year== DateFormat('yyyy').format(DateTime.now()))
//                                     {
//                                       absorbOfArrow=true;
//                                     }
//                                   else
//                                     {
//                                       absorbOfArrow=false;
//                                       if(monthChange==0){
//                                         monthChange=11;
//                                       }
//                                       else{
//                                         monthChange--;
//                                       }
//                                       if(monthChange==11){
//                                         year=(int.parse(year)-1).toString();
//                                       }
//                                     }
//
//                                 }
//
//                                 );
//                                 },),
//                           ),
//                            Expanded(
//                              child: Text(acl.months[monthChange].substring(0, 3),style: const TextStyle(
//                               fontSize: 40,
//                               color: Colors.white,
//                           ),),
//                            ),
//                           const SizedBox(width: 20),
//                           ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff006aff)),
//                                 overlayColor: MaterialStateProperty.all<Color>(const Color(0xff006aff)),
//                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
//                                   side:  const BorderSide(color: Colors.white, width: 1),
//                                   borderRadius: BorderRadius.circular(30.0),
//                                 ),)
//                             ),
//                             child:  Text(year,style: const TextStyle(color:Colors.white,)),
//                             onPressed: (){},
//                           ),
//                           Expanded(
//                             child: IconButton(icon: const Icon(Icons.arrow_forward_ios_outlined,
//                               color: Colors.white,
//                                 size:30),
//                               onPressed: () {
//                                 setState(() {
//                                   absorbOfArrow=false;
//                                   if(monthChange==11){
//                                     monthChange=0;
//                                   }
//                                   else{
//                                     monthChange++;
//                                   }
//                                   if(monthChange==0){
//                                   year=(int.parse(year)+1).toString();
//                                   }
//                                 });
//                               },),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10,),
//                   SizedBox(
//                     height: 30,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: ListView.separated(
//                         physics: const NeverScrollableScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                           padding: const EdgeInsets.all(4),
//                           itemCount: 7,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Text( acl.nameOfDays[index].substring(0, 3),
//                             style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),);
//                           },
//                         separatorBuilder: (BuildContext context, int index) {
//                           return const SizedBox(width: 21);
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 230,
//                     child: GridView.builder(
//                       itemCount: 42,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 7,
//                         crossAxisSpacing: 0,
//                         mainAxisSpacing: 0,
//                         childAspectRatio: 1.17
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return AbsorbPointer(
//                           absorbing:false,
//                           child: InkWell(onTap: () {
//                             setState(() {
//                               if(acl.ReturnList()[1][index]==Colors.grey)
//                                 {
//                                   if(monthChange==0){
//                                     monthChange=11;
//                                   }
//                                   else{
//                                     monthChange--;
//                                   }
//                                   if(monthChange==11){
//                                     year=(int.parse(year)-1).toString();
//                                   }
//                                 }
//                               else{
//                                 checkClicked=true;
//                               colorOfClick[index]=Colors.red;}
//                             });
//                             },
//                             child:Container(
//                               height: 60,
//                               width: 60,
//                               decoration:  BoxDecoration(
//                                   // ignore: unrelated_type_equality_checks
//                                   color: colorOfClick[index],
//                                   shape: BoxShape.circle),
//                               child: Center(
//                                 child: Text(acl.ReturnList()[0][index].toString(),
//                                   style: TextStyle(color:acl.ReturnList()[1][index]),
//                                   // ignore: unrelated_type_equality_checks),
//                               )
//                             ),
//                           ),
//                           )
//                         );
//
//                       },
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       DefualtBoxAction(
//                           width: 125,
//                           textOfBox: 'Cancel',
//                           onTap: () {}),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       const DefualtComma(changComma: false),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       DefualtBoxAction(
//                           width: 125,
//                           textOfBox: 'Done',
//                           onTap: () {}),
//                     ],
//                   ),
//                 ],
//               ),
//
//         ),
//       ),
//     );
//   }
//
//
//
// }