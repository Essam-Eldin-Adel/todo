import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../celender/celander-code.dart';
import '../celender/celender.dart';
import '../component/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
class WriteTasks extends StatefulWidget {
  const WriteTasks({Key? key}) : super(key: key);
  @override
  State<WriteTasks> createState() => WriteTasks_State();
}

// ignore: camel_case_types
class WriteTasks_State extends State<WriteTasks> {
  var textcontroller=TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool showCursor=true;
  bool readOnly=true;
  bool changeTaskForm=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                     Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color:Colors.grey.withOpacity(0.5),
                              width:1,),
                          ),
                          child: IconButton(onPressed: () {
                            Navigator.pop(context);
                          },
                            icon: const Icon(Icons.close_rounded,

                              color: Colors.black87,),

                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        ),
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                       Expanded(
                         child: Form(
                            key:formkey ,
                            child: TextFormField(
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                                  hintText: 'Enter new task',
                                  hintStyle: TextStyle(color: Color(0xffa7b0d1),
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400),
                                  fillColor: Colors.transparent,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                                textCapitalization: TextCapitalization.sentences,
                                keyboardType: TextInputType.text,
                                controller: textcontroller,
                                autofocus: true,
                                readOnly:readOnly ,
                                showCursor:showCursor ,
                                strutStyle: const StrutStyle(fontSize: 27),

                                onTap: () {
                                  SystemChannels.textInput.invokeMethod('TextInput.show');
                                  setState(() {
                                    readOnly=false;
                                    showCursor=false;
                                  });
                                } ,
                                validator:(value) {
                                  if (value!.isEmpty) {
                                    return 'You must enter the task';
                                  }
                                  return null;},
                              )
                              ),
                       ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.6),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color:changeTaskForm?const Color(0xff006aff):const Color(0xfff757ff),
                                  width:3,),
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color:const Color(0xffd8dee8),
                                  width:2,),
                              ),
                              child:IconButton(onPressed: (){
                                setState(() {
                                  changeTaskForm=!changeTaskForm;
                                });
                              },
                                splashColor:Colors.white,
                                highlightColor: Colors.white,
                                icon:  Icon(changeTaskForm?Icons.home:Icons.work,
                                  color:changeTaskForm?const Color(0xff006aff):const Color(0xfff757ff),
                                  size: changeTaskForm?17:14,),)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Row(
                      children: [
                        DefaultMaterialButtonWithAnimation(

                          onPressed: () {
                          },
                          buttonText: DateFormat('MM/dd/yyyy').format(DateTime.now()),
                          buttonIcon: Icons.calendar_today_outlined,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultMaterialButtonWithAnimation(
                          onPressed: () {
                          },
                          buttonText: DateFormat('hh:mm a').format(DateTime.now()),
                          buttonIcon: Icons.access_time_rounded,
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(55.0),
                    child: IconsScreen(),
                  ),
                  const SizedBox(
                      height: 35),
                   SizedBox(
                     width: 147,
                     child: MaterialButton(
                         shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.0))) ,
                         color: const Color(0xff006aff),
                         elevation: 2,
                         height: 50,
                         splashColor:const Color(0xff006aff),
                         highlightColor: const Color(0xff006aff),
                         minWidth: 30,
                         onPressed:() {
                           if(formkey.currentState!.validate()){
                             Navigator.pop(context);
                           }
                         },
                         child: Row(
                             children:  const [
                               SizedBox(width: 15),
                               Text('New task',
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white
                                   )),
                               SizedBox(width: 10),
                               Icon(Icons.keyboard_arrow_up,
                                   size: 23,
                                   color:  Colors.white),
                             ]
                         )
                     ),
                   ),
                      ]),
            ),),
          const Calendar(),
        ],
      ),
    );
  }
}

