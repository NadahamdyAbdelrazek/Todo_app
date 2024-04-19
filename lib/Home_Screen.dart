
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/add_task_bottom_sheet.dart';
import 'package:todo_app/tabs/setting_tab.dart';
import 'package:todo_app/tabs/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Provider/My_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: provider.getBacKgroundImage(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appname,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: addtaskbottomsheet());
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Color(0xff5D9CEC),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.white, width: 3)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: provider.getBacKgroundImage(),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          selectedItemColor: Color(0xff5D9CEC),
          unselectedItemColor: Color(0xffC8C9CB),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  size: 33,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 33,
                ),
                label: ""),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    Taskstab(),
    Settingstab(),
  ];
}
