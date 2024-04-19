import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'Provider/My_provider.dart';

class Taskitem extends StatelessWidget {
  const Taskitem({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            color: provider.getBacKgroundImage(), borderRadius: BorderRadius.circular(20)),
        child: Slidable(
            startActionPane: ActionPane(extentRatio: .7,motion: DrawerMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                label: "Delete",
                backgroundColor: Colors.red,
                icon: Icons.delete,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20 )),

              ),
              SlidableAction(
                onPressed: (context) {},
                label: "Edit",
                backgroundColor: Colors.blue,
                icon: Icons.edit,
              )
            ]),
          child: Row(
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 12),
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Task Title",
                    style: TextStyle(fontSize: 22,color: Colors.blue),
                  ),
                  Text(
                    "Task Description",
                    style: TextStyle(fontSize: 16,color: Colors.blue),
                  ),
                ],
              ),
              Spacer(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
        ),

    );
  }
}
