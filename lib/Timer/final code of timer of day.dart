
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Timer/timercomponent.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class SunAndMoon extends StatefulWidget {
   const SunAndMoon({Key? key,
    })
      : super(key: key);
   @override
  // ignore: no_logic_in_create_state, null_check_always_fails
  State<SunAndMoon> createState() => SunAndMoon_State();
}
// ignore: camel_case_types
class SunAndMoon_State extends State<SunAndMoon> with TickerProviderStateMixin {
  bool chageTime = true;

  bool changState =false;
  late TickerProvider ves;
  late AnimationController controller;
  late Animation<double> _scaleAnimationX;
  late Animation<double> _scaleAnimationY;
  late Animation<double> _scaleAnimationZ;
  late Path _path;
  //  loop(int value){
  //   double sum=0;
  //   for(int i=0 ; i<24;i++){
  //     widget.listOfPosition[i]=sum ;
  //     sum=sum+0.5;
  // }
  //   return widget.listOfPosition[value];
  // }

  // ignore: non_constant_identifier_names
  // Values(double value){
  //   _path  = drawCurve_State().drawPath();
  //   _controller = AnimationController(
  //       duration: changBool?const Duration(milliseconds: 300):const Duration(milliseconds: 300),
  //       vsync: this);
  //   _scaleAnimationY = TweenSequence(
  //       <TweenSequenceItem<double>>[
  //         TweenSequenceItem<double>(
  //             tween: Tween<double>(
  //                 begin: widget.listOfPosition[value.toInt()],
  //                 end: widget.listOfPosition[value.toInt()]),
  //             weight: 50
  //         ),
  //       ]
  //   ).animate(_controller);
  //   _scaleAnimationX = TweenSequence(
  //       <TweenSequenceItem<double>>[
  //         TweenSequenceItem<double>(
  //             tween: Tween<double>(
  //                 begin: widget.listOfPosition[value.toInt()],
  //                 end: widget.listOfPosition[value.toInt()]),
  //             weight: 50
  //         ),
  //       ]
  //   ).animate(_controller);
  //   _scaleAnimationZ = TweenSequence(
  //       <TweenSequenceItem<double>>[
  //         TweenSequenceItem<double>(
  //             tween: Tween<double>(
  //                 begin: drawCurve_State().calculate( _scaleAnimationY.value,_path).dy,
  //                 end: 150),
  //             weight: 50
  //         ),
  //       ]
  //   ).animate(_controller);
  //   // _colorAnimation=TweenSequence<Color?>([
  //   //   TweenSequenceItem(
  //   //     weight: 1.0,
  //   //     tween: ColorTween(begin: const Color(0xff89b8d6), end: Colors.lightBlueAccent),
  //   //   ),
  //   //   TweenSequenceItem(
  //   //     weight: 1.0,
  //   //     tween: ColorTween(begin: Colors.lightBlueAccent, end: const Color(0xff3e6f8c)),
  //   //   ),
  //   //   TweenSequenceItem(
  //   //     weight: 1.0,
  //   //     tween: ColorTween(begin:  const Color(0xff3e6f8c), end: const Color(0xff1c2f3b)),
  //   //   ),
  //   //   TweenSequenceItem(
  //   //     weight: 1.0,
  //   //     tween: ColorTween(begin: const Color(0xff1c2f3b), end: const Color(0xff89b8d6)),
  //   //   ),
  //   // ]).animate(_controller);
  //   _controller.forward();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _path  = drawCurve_State().drawPath();
    controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this);
    _scaleAnimationX = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(
                  begin: SunAndMoonCubit.get(context).changBool?0:SunAndMoonCubit.get(context).listOfPosition[SunAndMoonCubit.get(context).hourNumber],
                  end: SunAndMoonCubit.get(context).changBool?1: SunAndMoonCubit.get(context).listOfPosition[SunAndMoonCubit.get(context).hourNumber]),
              weight: 50
          ),
        ]
    ).animate(controller);
    _scaleAnimationY = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(
                  begin: SunAndMoonCubit.get(context).changBool?0: SunAndMoonCubit.get(context).listOfPosition[SunAndMoonCubit.get(context).hourNumber],
                  end:  SunAndMoonCubit.get(context).changBool?1:SunAndMoonCubit.get(context).listOfPosition[SunAndMoonCubit.get(context).hourNumber]),
              weight: 50
          ),
        ]
    ).animate(controller);
    _scaleAnimationZ = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(
                  begin: SunAndMoonCubit.get(context).changBool?0:drawCurve_State().calculate(SunAndMoonCubit.get(context).scaleAnimationY.value,_path).dy,
                  end: 150),
              weight: 50
          ),
        ]
    ).animate(controller);
    SunAndMoonCubit.get(context).setController=this;
    controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SunAndMoonCubit(),
        child: BlocConsumer<SunAndMoonCubit, SunAndMoonStates>(
        listener: (BuildContext context, state) {},
    builder: (BuildContext context, Object? state) {
      SunAndMoonCubit cubit = SunAndMoonCubit.get(context);
    return AnimatedBuilder(animation: controller,
        builder: (BuildContext context, _) {
          return  Container(
            // Use the properties stored in the State class.
              width: 350,
              // widget.isClick?0:
              height: 380,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
              children: [
                // const Image(
                //   image: AssetImage(
                //       'images/kisspng-daytime-atmosphere-of-earth-computer-wallpaper-the-vast-sky-5a6fe6021844d6.3217390815172828180994.png'),
                //   height: 263,
                //   width: 400,
                // ),
                Positioned(
                  top: cubit.changBool?0:drawCurve_State().calculate( _scaleAnimationX.value,_path).dy,
                  left:drawCurve_State().calculate( _scaleAnimationX.value,_path).dx,

                  child:changState?const Image(
                    image: AssetImage(
                        'images/kindpng_51340.png'),
                    height: 50,
                    width: 50,
                  ):const Image(
                    image: AssetImage(
                        'images/—Pngtree—universe starry sky sky sun_3924608.png'),
                    height: 60,
                    width: 60,
                  ),
                ),
              ]
          ));
        }
    );
  }));}
}