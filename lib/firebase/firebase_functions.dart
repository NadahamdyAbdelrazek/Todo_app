import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:todo_app/firebase/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollections(){
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }
  static CollectionReference<UserModel> getUserCollections(){
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }
  static Future<void>addUser(UserModel usermodel) {
    var collection=getUserCollections();
    var docRef= collection.doc(usermodel.id);
    return docRef.set(usermodel);
  }
  static Future<void> addTask(TaskModel task) {
    var collection=getTasksCollections();
    var docRef= collection.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }
  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date){
    return getTasksCollections()
    .where("userID",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch)
    .orderBy("title")
        .snapshots();
  }

  static Future<void> deleteTask(String id){
    return getTasksCollections().doc(id).delete();

  }
  static Future<void> updateTask(TaskModel task){
    return getTasksCollections().doc(task.id).update(task.toJson());

  }


  static creatAccount({required String username,required String email,required String phone,required String password, required Function onSucess,required Function onError})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     // credential.user!.sendEmailVerification();
      UserModel userModel=UserModel(
        email: email,
        phone: phone,
        id: credential.user!.uid,
        username: username
      );
      addUser(userModel);
      onSucess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
      onError(e.message);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static login(String email,String password,Function onSucess,Function onError)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
     // if(credential.user!.emailVerified){
        onSucess();
      //}else{
        //onError("Please verfiy your account");
      //}
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
}
