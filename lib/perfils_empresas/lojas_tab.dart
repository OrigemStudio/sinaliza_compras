import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/tiles/category_tile.dart';

class LojasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection('cidades')
          .document('Rio Pardo')
          .collection("perfis")
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividedTiles = ListTile.divideTiles(
              tiles: snapshot.data.documents.map((doc) {
                return CategoryTile(doc);
              }).toList(),
              color: Colors.grey[700])
              .toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}
