import 'package:flutter/material.dart';
import 'package:todoapp_version2/component/component.dart';
import '../modules/mainscreen.dart';
// ignore: must_be_immutable
class  HomeScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var formkey =GlobalKey<FormState>();
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return mainscreen(name: 'essam',);
    //   Scaffold(
    //   body: Container(
    //     width: double.infinity,
    //     decoration:  const BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           Color(0xff27a7b2),
    //           Color(0xff27e8de),
    //           Color(0xff50eba8),],
    //           begin:Alignment.topRight,
    //         end: Alignment.bottomLeft
    //
    //       ),
    //     ),
    //       child: SafeArea(
    //           child: Padding(
    //             padding:  const EdgeInsets.all(20.0),
    //             child: Stack(
    //                           children: [
    //                              const Align(
    //                     alignment: Alignment(0.0,-0.6),
    //                     child: Text('Hi There welcome to',
    //                     style: TextStyle(
    //                         fontSize: 30,
    //                           fontWeight: FontWeight.bold,
    //                       color: Colors.white
    //
    //                     ),),
    //                   ),
    //                            const Align(
    //                             alignment: Alignment(0, -0.4),
    //                             child: Text('Ticktin',
    //                             style: TextStyle(
    //                               fontSize: 40,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white
    //                             ),)
    //                             ,
    //                           ),
    //                             Form(
    //                               key: formkey,
    //                               child: Align(
    //                                 alignment: const Alignment(0,0),
    //                                     child: defultbox(controller: nameController,
    //                                         keybordtype: TextInputType.text,
    //                                         validate: (value){
    //                                       if(value!.isEmpty){
    //                                         return'You must enter your name';
    //                                       }
    //                                       else{
    //                                       return null;}
    //                                         },
    //                                         text: 'Enter your name',
    //                                         textcolor: Colors.black54,
    //                                         pref: Icons.drive_file_rename_outline,
    //                                         prefixcolor:Colors.white12,
    //                                   boxcolor:Colors.white.withOpacity(0.1),
    //                                   sidecolor:Colors.white,
    //                                       raduis: 40.0,
    //                                   ),
    //                             ),
    //                             ),
    //                                 Align(
    //                                 alignment: const Alignment(0.0,0.5),
    //                                 child: button(width: double.infinity,
    //                                     background: Colors.white.withOpacity(0.5),
    //                                     text: 'Next',
    //                                 font: FontWeight.bold,
    //                                 size: 23,
    //                                 pressed: (){
    //                                   final isvalidform= formkey.currentState!.validate();
    //                                   if(isvalidform ){
    //                                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    //                                         builder:(context) => mainscreen(name: nameController.text)
    //                                     ),
    //                                         (route) => false
    //                                     );
    //                                   }
    //                                 }
    //                                 )
    //                                 ),
    //                           ]
    //                       ),
    //           ),
    //           ),
    //       ),
    // );
  }
}
