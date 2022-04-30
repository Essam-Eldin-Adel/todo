
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
class CalculateCalender {
  late List<int> numberOfDaysPerMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  // numberOfDaysPerMonths is list contain the number of days in each months
  late List<int> listOfDayOfCurrentMonth;
  //listOfDayOfCurrentMonth this list contain number of days in current month
  late List<int>  listOfDayOfLastMonth;
  //contain number of days in last month
  late List<int>  listOfDayOfNextMonth;
  //contain number of days in next month
  List<String> nameOfDays =  ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
//nameOfDays is list contain name of each day of week
  List<String> months =  ['January','February','March','April','May','June','July','August','September','October','November','December'];
  // list contain name of months
  String year= DateFormat('yyyy').format(DateTime.now());
  //determine current year
  late int yearChange=(int.parse(year));
  // conversion String to int
  String month= DateFormat('MM').format(DateTime.now());
  //determine current month
  late int monthChange=(int.parse(month)-1);
  // conversion String to int
  String today= DateFormat('d').format(DateTime.now());
  //determine which day is today
  late int  day=(int.parse(today));
  //conversion String to int

  // ignore: non_constant_identifier_names
  CalculateDay(){
    late String dayOfWeek= DateFormat('EEEE').format(
        DateTime.parse(monthChange>8?'$yearChange-${monthChange+1}-01':'$yearChange-0${monthChange+1}-01'));
    // dayOfWeek is string of the name of day in the date which i write between parse()
    for(var number=0;number<7;number++){
      if(dayOfWeek==nameOfDays[number]){
        return number;
      }
    }
  } // this function  return number of starting day of month
  // ignore: non_constant_identifier_names
  CalculateMonths() {

    late List<List<int>> listOfAllDays ;
    // listOfAllDays this is the list that contain the numbers of current,last and next months
    if (yearChange % 4 == 0) {
      numberOfDaysPerMonths[1] = 29;
    }
    else {
      numberOfDaysPerMonths[1] = 28;
    }
    for(var i=0;i<12;i++)
    {
      listOfAllDays= List.generate(12,
              (i) => List.generate(numberOfDaysPerMonths[i] , (count) => count+1));
    }

    return listOfAllDays;
  } // this function to determine the days of the months
  // ignore: non_constant_identifier_names
  List ReturnList(){
     List<Color> colorOfDays=List.generate(42,(count)=>Colors.black);
    //colorOfDays this for color of numbers
    int startOfMonth=CalculateDay()-1;
    //startOfMonth number of day to start current month
    int numberOfInsert=0;
    int numberOfInsert2=0;
    int numberOfInsert3=0;
    int numberOfNextMonth=monthChange+1;
    //numberOfNextMonth equal monthChange not (monthChange+1) because list start from 0 and month start from 1
    int numberOfLastMonth=monthChange-1;
    //numberOfLastMonth equal (monthChange-2) not (monthChange-1) because list start from 0 and month start from 1
    if(numberOfLastMonth<0)numberOfLastMonth=11;
    // change to last year
    if(numberOfNextMonth>11)numberOfNextMonth=0;
    // change to next year
    listOfDayOfNextMonth=CalculateMonths()[numberOfNextMonth];
    // list that contain number of day for next month
    listOfDayOfLastMonth=CalculateMonths()[numberOfLastMonth];
    // list that contain number of day for last month
    listOfDayOfCurrentMonth=CalculateMonths()[monthChange];
    // list that contain number of day for current month
     List<int>listOfAllDays=CalculateMonths()[monthChange];
    // ignore: unrelated_type_equality_checks
    while(numberOfInsert<day&&monthChange==(int.parse(month)-1)&&year== DateFormat('yyyy').format(DateTime.now()))
    {
      colorOfDays[numberOfInsert+startOfMonth]=Colors.grey;
      numberOfInsert++;
    }

    if(startOfMonth!=0)
    {
    for(var i=(listOfDayOfLastMonth.length-startOfMonth);i<=listOfDayOfLastMonth.length;i++)
    {
      listOfAllDays.insert(numberOfInsert2,listOfDayOfLastMonth[i-1]);
      colorOfDays[numberOfInsert2]=Colors.grey;
      numberOfInsert2++;
    }
    }

    while(listOfAllDays.length<42)
    {
      listOfAllDays.add(listOfDayOfNextMonth[numberOfInsert3]);
      colorOfDays[41-numberOfInsert3]=Colors.grey;
      numberOfInsert3++;
    }


    return [listOfAllDays,colorOfDays,startOfMonth];
  }  // this function return list of days and colors
}
