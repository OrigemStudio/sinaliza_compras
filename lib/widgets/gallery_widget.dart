import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/product_data.dart';

class GaleryWidget extends StatefulWidget {
  final ProductData product;

  GaleryWidget(this.product);

  @override
  _GaleryWidgetState createState() => _GaleryWidgetState(product);
}

class _GaleryWidgetState extends State<GaleryWidget> {
  final ProductData product;

  _GaleryWidgetState(this.product);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .52,
        child: Card(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height *.05,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .015,
                          bottom: MediaQuery.of(context).size.height * .008,
                        left: MediaQuery.of(context).size.width *.032
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        )
                      ),
                      child: Text(
                        product.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(45)),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height *.05,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                            )
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: ScreenUtil.instance.setSp(45),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            }),
                      ))
                ],
              ),
              AspectRatio(
                aspectRatio: 1.05,
                child: Carousel(
                  boxFit: BoxFit.contain,
                  images: product.imageGallery.map((url) {
                    return NetworkImage(url);
                  }).toList(),
                  dotSize: 4.0,
                  dotSpacing: 25.0,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.purple,
                  autoplay: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
