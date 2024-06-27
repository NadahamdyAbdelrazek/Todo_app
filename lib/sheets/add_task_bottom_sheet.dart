import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Theme/My_theme.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class addtaskbottomsheet extends StatefulWidget {
  addtaskbottomsheet({super.key});

  @override
  State<addtaskbottomsheet> createState() => _addtaskbottomsheetState();
}

class _addtaskbottomsheetState extends State<addtaskbottomsheet> {
  var formkey = GlobalKey<FormState>();
  var selecteddate = DateTime.now();
  var descriptioncontroller = TextEditingController();
  var titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(AppLocalizations.of(context)!.addnewtask,
              style: MyThemeData.lighttheme.textTheme.bodyLarge),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: titlecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Task Tittle";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.red)),
              label: Text(AppLocalizations.of(context)!.tittle),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: descriptioncontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Task Description";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.red)),
              label: Text(AppLocalizations.of(context)!.description),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.selecttime,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              )),
          SizedBox(
            height: 16,
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
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  TaskModel task = TaskModel(
                      title: titlecontroller.text,
                      description: descriptioncontroller.text,
                      date: DateUtils.dateOnly(selecteddate)
                          .millisecondsSinceEpoch,
                      userId: FirebaseAuth.instance.currentUser!.uid);
                  FirebaseFunctions.addTask(task);
                  Navigator.pop(context);
                }
              },
              child: Text(
                AppLocalizations.of(context)!.addtask,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),
        ]),
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
      setState(() {});
    }
  }
}
