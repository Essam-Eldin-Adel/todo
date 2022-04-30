import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_version2/shared/cubit/cubit.dart';
import 'component/constant.dart';
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
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:(BuildContext context) =>AppCubit(),),
        BlocProvider(create:(BuildContext context) =>CalendarCubit(),),
        BlocProvider(create:(BuildContext context) =>SunAndMoonCubit(),),
      ],
        child: const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WriteTasks(),
    )
    );
  }
}