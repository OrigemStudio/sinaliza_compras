import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/widgets/horizontal_scroll_promo_lojas.dart';
import 'package:sinaliza_compras/widgets/horizontal_scroll_promo_viagem.dart';

class TitleListPromoViagem extends StatelessWidget {

  final DocumentSnapshot snapshot;

  TitleListPromoViagem(this.snapshot);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height *.05,
          padding: const EdgeInsets.only(top: 7, left: 8, right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.white.withOpacity(0.3),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black.withAlpha(70),
                    offset: const Offset(3.0, 10.0),
                    blurRadius: 15.0)
              ]
          ),
          child: Text(snapshot.data['nomeViagem'],
            style: TextStyle(
              fontSize: ScreenUtil.instance.setSp(45),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height /1.65,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(),
          child: HorizontalScrollPromoViagem(snapshot),
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
