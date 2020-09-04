import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/cards/card_brinde.dart';

class BrindeSinalizaScreen extends StatefulWidget {
  @override
  _BrindeSinalizaScreenState createState() => _BrindeSinalizaScreenState();
}

class _BrindeSinalizaScreenState extends State<BrindeSinalizaScreen> {
  final DocumentSnapshot snapshot;

  _BrindeSinalizaScreenState({this.snapshot});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
        body: DefaultTabController(
      length: 0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 8,
              expandedHeight: MediaQuery.of(context).size.height / 3,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text("Brindes do Sinaliza",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(40),
                    )),
                background: Image.asset(
                  'assets/CardBrindeSinalizaBlack.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('brindes')
                .document('Rio Pardo')
            .collection('2020')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                      children: snapshot.data.documents.map((doc){
                        return CardBrinde(doc);
                      }).toList()
                    );
              }
            }),
      ),
    ));
  }
}
