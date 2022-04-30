import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/component/component.dart';
import 'package:todoapp_version2/shared/cubit/cubit.dart';
import 'package:todoapp_version2/shared/cubit/states.dart';
import '../component/screenchange.dart';
import '../component/task.dart';


// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  final String name;

  MainScreen({Key? key,
    required this.name}) : super(key: key);
  late double screenHeight;
  late double screenWidth;

  Duration duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashBord(context),
        ],),
    );
  }
    Widget menu(context) {
      return SafeArea(
        child:
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff261057),
                      Color(0xff220b4f),
                      Color(0xff2d0f3b),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                )
            ),
            width: double.infinity,
            child: Column(
              children: const [
                Text('Hello',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            )
        ),
      );
    }

    Widget dashBord(context) {
      return BlocBuilder<AppCubit,AppStates>(
       builder: (BuildContext context,Object? state){
         AppCubit cubit = AppCubit.get(context);
       return AnimatedPositioned(
           duration: duration,
           // time for open and close menu
           top: cubit.isMenu ? 0 : 0.05 * screenHeight,
           // this is for size of screen when menu open
           bottom: cubit.isMenu ? 0 : 0.05 * screenHeight,
           // this is for size of screen when menu open
           right: cubit.isMenu ? 0 : -0.5 * screenWidth,
           // this is for size of screen when menu open
           left: cubit.isMenu ? 0 : 0.7 * screenWidth,
           // this is for size of screen when menu open
           child: SafeArea(
               child: Material(
                 color: Colors.white.withOpacity(0.99),
                 borderRadius: BorderRadius.all(Radius.circular(
                     cubit.isMenu ? 0 : (0.04 * screenHeight)
                 )), //this make screen edgy circle when click menu
                 child: Stack(
                   children: [
                     SizedBox(
                       width: double.infinity,
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                             vertical: 0.02 * screenHeight,
                             horizontal: 0.05 * screenWidth),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                                 children: [
                                   TextIcons(onPressed: () {
                                     AppCubit.get(context).menuChange();
                                   },
                                     textIcon: Icons.menu,
                                     sizeOfIcon: 30,
                                   ),
                                   //this is menu icon
                                   const Expanded(
                                     child: Center(
                                       child: TextStyles(text: 'Ticktin',
                                         colorOfText: Color(0xffb4b9cc),
                                         size: 35,),
                                     ),
                                   ),
                                   //this is menu icon
                                   TextIcons(onPressed: () {},
                                     textIcon: Icons.search,
                                     sizeOfIcon: 25,
                                   ),
                                   const SizedBox(
                                     width: 20,
                                   ),

                                   TextIcons(onPressed: () {},
                                     textIcon: Icons.notifications_sharp,
                                     sizeOfIcon: 25,
                                   ),

                                 ]
                             ),
                             // this is for appbar
                             const SizedBox(
                               height: 30,
                             ),
                             TextStyles(text: 'What\'s up, $name !',
                               colorOfText: Colors.black87, size: 35,),
                             // (what's up) text
                             const SizedBox(
                               height: 30,
                             ),
                             const TextStyles(text: 'CATEGORIES',
                               colorOfText: Color(0xffb4b9cc), size: 13,),
                             // (categories) text
                             const SizedBox(
                               height: 25,
                             ),
                             SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Column( // this column because sized box to make wrap
                                 children: [
                                   Row(
                                     children: [
                                       BoxOfTasks(numberOfTasks: '5 Tasks',
                                           categories: 'Business',
                                           tasks: 5,
                                           maxTasks: 8,
                                           activeColor: const Color(0xfff757ff),
                                           inactiveColor: Colors.purple
                                               .withOpacity(0.1)),
                                       // business box
                                       const SizedBox(
                                         width: 15,
                                       ),
                                       BoxOfTasks(numberOfTasks: '3 Tasks',
                                           categories: 'Personal',
                                           tasks: 3,
                                           maxTasks: 8,
                                           activeColor: const Color(0xff006aff),
                                           inactiveColor: Colors.lightBlueAccent
                                               .withOpacity(0.3)),
                                       //personal box
                                       const SizedBox(
                                         height: 25,
                                       ),
                                     ],
                                   ),
                                   const SizedBox(
                                     height: 25,
                                   ),
                                 ],
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.symmetric(horizontal: 0.02 *
                                   screenWidth),
                               child: const TextStyles(text: 'TODAY\'S TASKS',
                                 colorOfText: Color(0xffb4b9cc), size: 13,),
                             ),
                             // (today's tasks) text
                             const SizedBox(
                               height: 25,
                             ),
                             TasksBord(tasksName: 'first task',
                               tasksDate: '2:58 PM',
                               clickColor: false,
                             ),
                             Expanded(
                               child: SingleChildScrollView(
                                   scrollDirection: Axis.vertical,
                                   child: Column(
                                       children: [
                                         AnimatedContainerApp(),
                                       ]
                                   )
                               ),
                             ),

                           ],
                         ),
                       ),
                     ),
                     const Padding(
                       padding: EdgeInsets.all(20.0),
                       child: ScreenChange(),
                     ),
                   ],
                 ),

               )
           )
       );}
     );
    }
  }
