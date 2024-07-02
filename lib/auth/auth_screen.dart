import 'package:flutter/material.dart';
import 'package:todo_app/auth/register.dart';

import 'login/Login.dart';


class AuthScreen extends StatelessWidget {
  static const String routename = "authscreen";

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("Login")),
              Tab(icon:Text("Register")),
            ],
          ),
          title: Text('Auth Screen'),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            RegisterTab(),

          ],
        ),
      ),
    );
  }
}
