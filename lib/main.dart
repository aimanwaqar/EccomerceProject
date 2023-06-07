import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccomerce_project/add_post.dart';
import 'package:eccomerce_project/loaddata.dart';
import 'package:eccomerce_project/purchases.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  //to connect to firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoadData(),
    );
  }
}
String login="shaikhnaila488@gmail.com";
//Stream<QuerySnapshot<Map<String, dynamic>>>maindata;

DocumentSnapshot? maindata;


