import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/product_data.dart';

class FrontCardPromo extends StatefulWidget {
  final ProductData product;

  FrontCardPromo(this.product);

  @override
  _FrontCardPromoState createState() => _FrontCardPromoState(this.product);
}

class _FrontCardPromoState extends State<FrontCardPromo> {
  ProductData product;

  _FrontCardPromoState(this.product);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      child: new Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .04,
              right: MediaQuery.of(context).size.width * .015,
              top: MediaQuery.of(context).size.height * .015,
              bottom: MediaQuery.of(context).size.width * .015,
            ),
            child: Text(
              product.title,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(50),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
          ),
          new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.imageGallery[0])),
                ),
              ),
              Text(
                'Imagem Ilustrativa',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: ScreenUtil.instance.setSp(30),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .041,
                right: MediaQuery.of(context).size.width * .015,
                top: MediaQuery.of(context).size.height * .015,
                bottom: MediaQuery.of(context).size.height * .015,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(65),
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .01,
                        left: MediaQuery.of(context).size.width * .005),
                    child:
                        product.unit == null ? Container() : Text(
                            product.unit,
                          style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(35),
                              color: Colors.white),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
