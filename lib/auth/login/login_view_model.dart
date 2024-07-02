import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/login/login_connector.dart';
import 'package:todo_app/base.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{
  login(String email,String password)async{
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
      connector!.hideLoading();
      connector!.gotohome();
      // if(credential.user!.emailVerified){
     // onSucess();
      //}else{
      //onError("Please verfiy your account");
      //}
    } on FirebaseAuthException catch (e) {
     // onError(e.message);
      connector!.hideLoading();
      connector!.showmessage(e.code);
    }
  }
}