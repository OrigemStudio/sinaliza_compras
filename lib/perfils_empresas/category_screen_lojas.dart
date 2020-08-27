import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/profile_data.dart';
import 'package:sinaliza_compras/tiles/profile_tile.dart';

class CategoryScreenLojas extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreenLojas(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text(snapshot.data['title']),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('cidades')
              .document('Rio Pardo')
              .collection("perfis")
              .document(snapshot.documentID)
              .collection("cliente")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else
              return GridView.builder(
                  itemCount: snapshot.data.documents.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProfileData data = ProfileData.fromDocument(
                        snapshot.data.documents[index]);
                    data.category = this.snapshot.documentID;
                    return ProfileTile(data);
                  });
          }),
    );


  }
}
