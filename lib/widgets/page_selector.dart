import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageSelector extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PageSelector({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("Lojas")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return null;
                    }));
        });
  }
}
