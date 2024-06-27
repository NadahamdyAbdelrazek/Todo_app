import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Theme/My_theme.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:todo_app/home/Edit_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Provider/My_provider.dart';

class Taskitem extends StatefulWidget {
  TaskModel model;

  Taskitem({required this.model, super.key});

  @override
  State<Taskitem> createState() => _TaskitemState();
}

class _TaskitemState extends State<Taskitem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: provider.getBacKgroundImage(),
          borderRadius: BorderRadius.circular(20)),
      child: Slidable(
        startActionPane:
            ActionPane(extentRatio: .7, motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(widget.model.id);
            },
            label: AppLocalizations.of(context)!.delete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTask.routename,arguments: widget.model);
            },
            label: AppLocalizations.of(context)!.edit,
            backgroundColor: Colors.blue,
            icon: Icons.edit,
          )
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 80,
              width: 4,
              decoration: BoxDecoration(
                  color: widget.model.isDone==true?Color(0xff61E757):Colors.blue, borderRadius: BorderRadius.circular(25)),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.model.title,
                  style: TextStyle(fontSize: 22, color:widget.model.isDone==true?Color(0xff61E757):Colors.blue),
                ),
                Text(
                  widget.model.description,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                widget.model.isDone = true;
                FirebaseFunctions.updateTask(widget.model);
              },
              child: widget.model.isDone == true
                  ? Text(AppLocalizations.of(context)!.done,
                      style: TextStyle(
                          color: Color(0xff61E757),
                          fontWeight: FontWeight.w700,
                          fontSize: 22))
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      decoration: BoxDecoration(
                          color: widget.model.isDone!?Color(0xff61E757):Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
