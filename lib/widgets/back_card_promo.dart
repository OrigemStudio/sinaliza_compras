import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/product_data.dart';

class BackCardPromo extends StatefulWidget {

  final ProductData product;

  BackCardPromo(this.product);

  @override
  _BackCardPromoState createState() => _BackCardPromoState(product);
}

class _BackCardPromoState extends State<BackCardPromo> {
  ProductData product;

  _BackCardPromoState(this.product);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      height: MediaQuery.of(context).size.height / 1,
      width: MediaQuery.of(context).size.width / 1,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .015,
        bottom: MediaQuery.of(context).size.height * .01,
        left: MediaQuery.of(context).size.width / 50,
        right: MediaQuery.of(context).size.width / 36,
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 18, top: 4, bottom: 4),
            child: Text(
              product.title,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(50),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            height: 25,
            color: Colors.white,
          ),
          Expanded(
            child: new Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 2.46,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height /26,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.green,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  'Descrição',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil.instance.setSp(30),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.description,
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(23),
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 900,
                  height: double.maxFinite,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                              'Cupom de Desconto',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(28),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 4,
                            right: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.deepOrange,
                          ),
                          child: Text(
                            product.cupom,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil.instance.setSp(34),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: EdgeInsets.only(
                            top: 4,
                            bottom: 32,
                          ),
                          child: Text(
                            product.cupomDesc,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil.instance.setSp(25),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
