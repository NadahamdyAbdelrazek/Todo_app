import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/login/login_connector.dart';
import 'package:todo_app/auth/login/login_view_model.dart';
import 'package:todo_app/base.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/home/Home_Screen.dart';

class LoginTab extends StatefulWidget  {
  LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends BaseView<LoginTab,LoginViewModel> implements LoginConnector {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;

  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.login(
                            emailController.text, passwordController.text);
                        //  () {
                        //   Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routename, (route) => false);
                        //  },
                        // (message) {
                        //  showDialog(
                        //   context: context,
                        //   barrierDismissible: false,
                        //   builder: (context) {
                        //     return AlertDialog(
                        //       title: Text("Error"),
                        //     content: Text(message),
                        //     actions: [
                        //       ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: Text("Okay")),
                        //      ],
                        //    );
                        //   },
                        //  );
                        //  });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  gotohome() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routename, (route) => false);
  }

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }


}
