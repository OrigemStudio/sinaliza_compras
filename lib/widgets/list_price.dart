import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/model/list_model.dart';

class ListPrice extends StatelessWidget {

  final VoidCallback buy;

  ListPrice(this.buy);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<ListModel>(
          builder: (context, child, model){

            double price = model.getProductsPrice();

            //double ship = model.getShipPrice();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Resumo da Lista",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil.instance.setSp(45),
                  ),
                ),
                SizedBox(height: 12.0,),
                Divider(),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",
                      style: TextStyle(fontWeight: FontWeight.w500),),
                    Text("R\$ ${(price).toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: ScreenUtil.instance.setSp(45),
                          fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
