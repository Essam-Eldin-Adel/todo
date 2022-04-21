import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10,),
                Text('Page 2', style: TextStyle(fontSize: 20, fontWeight : FontWeight.bold),),
              ],
            ),
          )

      ),
    );
  }
}
