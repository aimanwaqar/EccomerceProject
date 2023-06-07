import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PurchasedItems extends StatefulWidget {
  const PurchasedItems({Key? key}) : super(key: key);

  @override
  State<PurchasedItems> createState() => _PurchasedItemsState();
}

class _PurchasedItemsState extends State<PurchasedItems> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
              return Container();
        }
    );
  }
  }

