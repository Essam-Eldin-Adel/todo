
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit,CalendarStates>(
        builder: (BuildContext context,Object? state){
      CalendarCubit cubit = CalendarCubit.get(context);
      cubit.calendar;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          // widget.isClick?0:
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children:  [
              Container(
              width: double.infinity,
              // widget.isClick?0:
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xff006aff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child:  Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: cubit.absorbOfArrow,
                        child: IconButton(icon:  Icon(Icons.arrow_back_ios_outlined,
                          color: cubit.absorbOfArrow?Colors.white38:Colors.white,
                          size:30 ,),
                          onPressed: () {
                          cubit.changeMonthsMinus();
                          },),
                      ),
                    ),
                    Expanded(
                      child: Text(cubit.months[cubit.calendar.monthChange].substring(0, 3),style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff006aff)),
                          overlayColor: MaterialStateProperty.all<Color>(const Color(0xff006aff)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(30.0),
                          ),)
                      ),
                      child:  Text(cubit.calendar.year,style: const TextStyle(color:Colors.white,)),
                      onPressed: (){},
                    ),
                    Expanded(
                      child: IconButton(icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size:30),
                        onPressed: () {
                          cubit.changeMonthsPlus();
                        },),
                    )
                  ],
                ),
              ),
            ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(4),
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Text( cubit.nameOfDays[index].substring(0, 3),
                        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 21);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 230,
                child: GridView.builder(
                  itemCount: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.17
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return AbsorbPointer(
                        absorbing:cubit.ClickButtonAbsorbing(index),
                        child: InkWell(onTap: () {
                          cubit.ClickButton(index);
                        },
                          child:Container(
                            height: 60,
                            width: 60,
                            decoration:  BoxDecoration(
                              // ignore: unrelated_type_equality_checks
                                color: cubit.colorOfCircle[index],
                                shape: BoxShape.circle),
                            child: Center(
                                child: Text(cubit.calendar.ReturnList()[0][index].toString(),
                                  style: TextStyle(color:cubit.calendar.ReturnList()[1][index]),
                                  // ignore: unrelated_type_equality_checks),
                                )
                            ),
                          ),
                        )
                    );

                  },
                ),
              ),
            ],
          ),

        ),
      ),
    );}
    );}
}



