import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Timer/timercomponent.dart';
import 'component/constant.dart';
import 'Timer/time.dart';
import 'modules/mainscreen.dart';
import 'modules/writetask.dart';
void main(){
  BlocOverrides.runZoned(
        () {
      runApp( const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WriteTasks(),
    );
  }
}