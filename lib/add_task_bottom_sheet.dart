import 'package:flutter/material.dart';

class addtaskbottomsheet extends StatefulWidget {
  addtaskbottomsheet({super.key});

  @override
  State<addtaskbottomsheet> createState() => _addtaskbottomsheetState();
}

class _addtaskbottomsheetState extends State<addtaskbottomsheet> {
  var formkey = GlobalKey<FormState>();
  var selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Add new Task",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Task Tittle";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red)),
              label: Text("Tittle"),
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
              label: Text("Description"),
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
                "Select time",
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
              "${selecteddate.toString().substring(0,10)}",  //"${selecteddate.toString().split(" ").first},

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
                  print("x");
                }
              },
              child: Text(
                "Add Task",
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

  selectDate(BuildContext context) async{
   DateTime? chosendate= await showDatePicker(
        initialDate: selecteddate,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
   if(chosendate !=null){
     selecteddate=chosendate;
     setState(() {

     });
   }
  }
}
