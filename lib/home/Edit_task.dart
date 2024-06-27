import 'package:flutter/material.dart';
import 'package:todo_app/Theme/My_theme.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/firebase/task_model.dart';

class EditTask extends StatefulWidget {
  static const String routename = "edittaskscreen";

  EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var selecteddate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var task=ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
      body: Card(
        margin: EdgeInsets.all(25),
        elevation: 5,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Edit Task",
                style: MyThemeData.lighttheme.textTheme.bodyLarge,
              ),
              Spacer(),
              TextFormField(
                initialValue: task.title,
                onChanged: (value) {
                  task.title=value;
                },
                decoration: InputDecoration(
                    labelText: "This is title",
                    labelStyle: MyThemeData.lighttheme.textTheme.bodySmall),
              ),
              Spacer(),
              TextFormField(
                initialValue: task.description,
                 onChanged: (value) {
                   task.description=value;
                 },

                decoration: InputDecoration(
                    labelText: "Task details",
                    labelStyle: MyThemeData.lighttheme.textTheme.bodySmall),
              ),
              Spacer(),
              Text(
                "Select time",
                style: MyThemeData.lighttheme.textTheme.bodySmall,
              ),
              InkWell(
                onTap: () {
                  selectDate(context);
                },
                child: Text(
                  "${selecteddate.toString().substring(0, 10)}",
                  //"${selecteddate.toString().split(" ").first},

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () async{
                    await FirebaseFunctions.updateTask(task);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyThemeData.primarycolor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                    padding: EdgeInsets.all(12),
                  ),
                  child: Text(
                    "Save Changes",
                    style: MyThemeData.lighttheme.textTheme.bodyLarge,
                  ),
              ),
              Spacer(flex: 3,),

            ],
          ),
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosendate = await showDatePicker(
        initialDate: selecteddate,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendate != null) {
      selecteddate = chosendate;
      setState(() {

      });
    }
  }
}
