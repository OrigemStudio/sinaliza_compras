import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/product_data.dart';
import 'package:sinaliza_compras/widgets/flip_card_promo.dart';

class HorizontalScrollPromoSaude extends StatefulWidget {

  final DocumentSnapshot snapshot;

  HorizontalScrollPromoSaude(this.snapshot);

  @override
  _HorizontalScrollPromoSaudeState createState() =>
      _HorizontalScrollPromoSaudeState(this.snapshot);
}

class _HorizontalScrollPromoSaudeState extends State<HorizontalScrollPromoSaude> {
  final DocumentSnapshot snapshot;

  _HorizontalScrollPromoSaudeState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('cidades')
            .document('Rio Pardo')
            .collection('product')
            .document('Saúde e Bem Estar')
            .collection('cliente')
            .document(snapshot.documentID)
            .collection('anuncio')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: const EdgeInsets.only(bottom: 0),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, index) {
                    ProductData data =
                    ProductData.fromDocument(snapshot.data.documents[index]);
                    return FlipCardPromo(data);
                  }),
            );
          }
        });
  }
}
