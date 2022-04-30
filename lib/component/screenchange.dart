import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/writetask.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
// The StatelessWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class ScreenChange extends StatelessWidget {
  const ScreenChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
    builder: (BuildContext context,Object? state)
    {
      AppCubit cubit = AppCubit.get(context);
      return Align(
        alignment: Alignment.bottomRight,
        child: AnimatedScale(
          duration: Duration(milliseconds: cubit.duration.toInt()),
          scale: cubit.circleScale,
          child:  InkWell(onTap: () {
                    cubit.OpenTasksScreen();},
                    child:Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: cubit.circleColor,
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add, color: Colors.white, size: 29,),
                    ),
                ),
          onEnd: () {
            if (cubit.circleScale == 40) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WriteTasks()),
              );
              print('finish');
              cubit.ReturnCircle();
            }
            else {
              cubit.EndOfCircle();
            }
          },
        ),
      );
    }
    );
  }
}

