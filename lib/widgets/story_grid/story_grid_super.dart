import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/stories_data.dart';
import 'package:sinaliza_compras/widgets/story_card.dart';

class StoryGridSuper extends StatefulWidget {
  final DocumentSnapshot snapshot;

  StoryGridSuper(this.snapshot);

  @override
  _StoryGridSuperState createState() => _StoryGridSuperState(this.snapshot);
}

class _StoryGridSuperState extends State<StoryGridSuper> {
  final DocumentSnapshot snapshot;

  _StoryGridSuperState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('cidades')
          .document('Rio Pardo')
          .collection('product')
          .document('Supermercados')
          .collection('cliente')
          .document(snapshot.documentID)
          .collection('story')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                bottom: 16,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.documents.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height),
                crossAxisCount: 12,
              ),
              itemBuilder: (BuildContext context, int index) {
                StoriesData data =
                    StoriesData.fromDocument(snapshot.data.documents[index]);
                return StoryCard(data);
              },
            ),
          );
        }
      },
    );
  }
}
