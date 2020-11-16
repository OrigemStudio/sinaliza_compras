import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/stories_data.dart';
import 'package:sinaliza_compras/widgets/story_card.dart';

class StoryGridLojas extends StatefulWidget {
  final DocumentSnapshot snapshot;
  final String search;

  StoryGridLojas(this.snapshot, this.search);

  @override
  _StoryGridLojasState createState() => _StoryGridLojasState(this.snapshot);
}

class _StoryGridLojasState extends State<StoryGridLojas> {
  final DocumentSnapshot snapshot;

  _StoryGridLojasState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 1) / 2.18;
    final double itemWidth = size.width / 2;
    return StreamBuilder<QuerySnapshot>(
      stream: (widget.search == '')
          ? Firestore.instance
          .collection('cidades')
          .document('Rio Pardo')
          .collection('stories')
          .document(snapshot.documentID)
          .collection('unity')
          .where("titleProfile",arrayContains: widget.search)
          .snapshots()
          : Firestore.instance
          .collection('cidades')
          .document('Rio Pardo')
          .collection('stories')
          .document(snapshot.documentID)
          .collection('unity')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 4.8,
            width: 4.8,
            child: Center(
              child: SizedBox(
                height: .05,
                width: .05,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              bottom: 16,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              StoriesData data =
              StoriesData.fromDocument(snapshot.data.documents[index]);
              return StoryCard(data);
            },
          );
        }
      },
    );
  }
}
