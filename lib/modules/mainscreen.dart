import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/component/component.dart';
import 'package:todoapp_version2/shared/cubit/cubit.dart';
import 'package:todoapp_version2/shared/cubit/states.dart';
import '../component/screenchange.dart';
import '../component/task.dart';

// ignore: camel_case_types, must_be_immutable
class mainscreen extends StatelessWidget
{
  final String name;

   mainscreen({
    required this.name
});
  bool visible =true;

  double screenhight = 200;

  double screenwidth = 200;

  Duration duration = const Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenwidth = size.width;
    screenhight = size.height;
    return BlocProvider(
        create: (BuildContext context) =>AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
            listener: (BuildContext context, state) {  },
            builder: (BuildContext context, Object? state) {
    return Scaffold(
    body: Stack(
      children: <Widget>[
        menu(context),
        dashBord(context),
      ],
    ),
    );
  }
    )
    );
  }

  Widget menu( context) {
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
                      child:Column(
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

  Widget dashBord( context) {
            return
                AnimatedPositioned(
                  duration: duration, // time for open and close menu
                  top:AppCubit.get(context).isMenu ? 0:0.05*screenhight,  // this is for size of screen when menu open
                  bottom:AppCubit.get(context).isMenu ? 0:0.05*screenhight,// this is for size of screen when menu open
                  right:AppCubit.get(context).isMenu ? 0:-0.5*screenwidth,// this is for size of screen when menu open
                  left:AppCubit.get(context).isMenu ? 0:0.7*screenwidth,// this is for size of screen when menu open
                  child: SafeArea(
                    child: Material(
                        color: Colors.white.withOpacity(0.99),
                        borderRadius: BorderRadius.all(Radius.circular(
                          AppCubit.get(context).isMenu?0:20
                      )), //this make screen edgy circle when click menu
                      child: Stack(
                        children: [
                          SizedBox(
                              width: double.infinity,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child:  Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                                 SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      IconButton(onPressed: (){
                                                        AppCubit.get(context).menuChange();
                                                      },
                                                          icon: const Icon(Icons.menu,
                                                            size: 27,
                                                            color: Color(0xffb4b9cc),),
                                                      ),
                                                      const SizedBox(
                                                        width: 70,
                                                      ),//this is menu icon
                                                      const Text('Ticktin',
                                                      style: TextStyle(
                                                        fontSize: 35,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xffb4b9cc)
                                                      ),) ,
                                                      const SizedBox(
                                                        width: 44,
                                                      ),//this is menu icon
                                                      IconButton(onPressed: (){},
                                                          icon: const Icon(Icons.search,
                                                            color: Color(0xffb4b9cc),)),//this is menu icon//this is menu icon
                                                      IconButton(onPressed: (){},
                                                          icon: const Icon(Icons.notifications_sharp,
                                                            color: Color(0xffb4b9cc),)),//this is menu icon
                                                    ],
                                                  ),
                                                ),// this is for appbar
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal:8),
                                              child: Text('What\'s up, ${name} !',
                                              style: const TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                                overflow: TextOverflow.ellipsis
                                              ),),
                                            ),// (what's up) text
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal:8),
                                              child: Text('CATEGORIES',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffb4b9cc),
                                                    overflow: TextOverflow.ellipsis
                                                ),),
                                            ),// (categories) text
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column( // this column because sized box to make wrap
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: box(numberOfTasks: '5 Tasks',
                                                            categories: 'Business',
                                                            taskColor: const Color(0xffb4b9cc),
                                                            taskSize: 15,
                                                            cateColor: Colors .black,
                                                            cateSize: 20,
                                                            tasks: 5,
                                                            maxTasks: 8,
                                                            taskBold: FontWeight.w700,
                                                            cateBold: FontWeight.w700,
                                                            inactiveColor: Colors.purple.withOpacity(0.1),
                                                            activeColor: const Color(0xfff757ff)),
                                                      ),// business box
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Container(
                                                        child: box(numberOfTasks: '3 Tasks',
                                                            categories: 'Personal',
                                                            taskColor:
                                                             const Color(0xffb4b9cc),
                                                            taskSize: 15,
                                                            cateColor: Colors .black,
                                                            cateSize: 20,
                                                            taskBold: FontWeight.w700,
                                                            cateBold: FontWeight.w700,
                                                            tasks: 3,
                                                            maxTasks: 8,
                                                            inactiveColor: Colors.lightBlueAccent.withOpacity(0.3),
                                                            activeColor: Colors.blue),
                                                      ),//personal box
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
                                            ),//this is business and personal box
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal:8),
                                              child: Text('TODAY\'S TASKS',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffb4b9cc),
                                                    overflow: TextOverflow.ellipsis
                                                ),),
                                            ),// (today's tasks) text
                                            const SizedBox(
                                              height: 25,
                                            ),
                                                // TasksBord(tasksName:'first task',
                                                //     tasksDate: '2:58 PM',
                                                // clickColor: false,
                                                // ),
                                            Expanded(
                                              child: SingleChildScrollView(

                                                scrollDirection:Axis.vertical ,
                                                child:Column(
                                                  children:[
                                              AnimatedContainerApp(),
                                                  ]
                                                )
                                              ),
                                            ),
                                            ScreenChange(),
                                          ],
                                        ),
                                        ),
                                      ),

                        ],
                      ),
                              )
                       )
                );
          }
}


