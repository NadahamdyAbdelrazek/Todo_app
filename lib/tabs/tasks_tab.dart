import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/tasks_item.dart';

class Taskstab extends StatelessWidget {
  const Taskstab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Stack(
          children: [
            Container(height: 70,color: Colors.blue,),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              height: 100,
              onDateChange: (date) {},
            ),
          ],
        ),
        SizedBox(height: 16,),
        Expanded(
          child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 8,),
            itemBuilder: (context, index) {
            return Taskitem();
          },itemCount: 9,),
        )
      ],
     
    );
  }
}
