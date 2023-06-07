import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';
import 'dart:math';


class Purchases extends StatelessWidget  {
  const Purchases({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Purcahses"),
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Users').doc('zoyakashif234@gmail.com').collection('Posts').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
                 if(snapshot.connectionState == ConnectionState.active){
                   if(snapshot.hasData && snapshot.data != null){
                     return ListView.builder(
                       scrollDirection: Axis.vertical,
                       itemCount: snapshot.data!.docs.length,
                         itemBuilder: (context, index){
                            Map<String, dynamic> userPosts = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                            return ListTile(
                                title: Text(userPosts["Title"].toString()),
                               trailing: Text(userPosts["Brand"].toString()),
                               subtitle: Text("Price:${userPosts["Price"]}".toString()),
                              leading: Container(
                                height: 50,
                                  width: 50,
                                  child: userPosts.containsKey('Image')?Image.network(userPosts["Image"].toString())
                                      :Container(),
                              ),

                            );
                         }
                     );
                   }
                   else{
                     return Text("No data found");
                   }
                 }
                 else{
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }

            },
          ),
        ),
      ),
    );
  }
}
