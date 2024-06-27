import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:todo_app/sheets/tasks_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Taskstab extends StatefulWidget {
   Taskstab({super.key});

  @override
  State<Taskstab> createState() => _TaskstabState();
}

class _TaskstabState extends State<Taskstab> {
var selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              color: Colors.blue,
            ),
            DatePicker(
              DateTime.now(),
              initialSelectedDate:selectedDate,
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              height: 100,
              onDateChange: (date) {
                selectedDate=date;
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
            child: StreamBuilder(
              stream: FirebaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("something went Wrong"),
                  ElevatedButton(onPressed: () {}, child: Text("try again")),
                ],
              );
            }
            List<TaskModel> taskList =
                snapshot.data?.docs.map((e) => e.data()).toList()??[];
            if(taskList.isEmpty){
              return Center(child: Text("No Tasks"));
            }
            return ListView.separated(separatorBuilder:(context, index) => SizedBox(height: 12) ,
                itemBuilder: (context, index) {
                  return Taskitem(model: taskList[index],);
                },itemCount: taskList.length,);
          },
        ))
      ],
    );
  }
}
