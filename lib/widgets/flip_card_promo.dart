import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/product_data.dart';
import 'package:sinaliza_compras/dialogs/dialog_share_promo.dart';
import 'package:sinaliza_compras/model/list_model.dart';
import 'package:sinaliza_compras/model/user_model.dart';
import 'package:sinaliza_compras/screens/list_screen.dart';
import 'package:sinaliza_compras/screens/login_screen.dart';
import 'package:sinaliza_compras/widgets/back_card_promo.dart';
import 'package:sinaliza_compras/widgets/front_card_promo.dart';
import 'package:sinaliza_compras/widgets/gallery_widget.dart';
import 'package:sinaliza_compras/datas/product_list_data.dart';

class FlipCardPromo extends StatefulWidget {

  final ProductData product;

  FlipCardPromo(this.product);

  @override
  _FlipCardPromoState createState() => _FlipCardPromoState(this.product);
}

class _FlipCardPromoState extends State<FlipCardPromo> {

  final ProductData product;

  String want;

  _FlipCardPromoState(this.product);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height *.02,
                right: MediaQuery.of(context).size.height *.02),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width *.835,
                height: MediaQuery.of(context).size.height *.42,
                margin: const EdgeInsets.only(
                    top: 8,
                    bottom: 2),
                child: FlipCard(
                  front: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white.withOpacity(0.3),
                        //borderRadius: new BorderRadius.circular(20.0),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black.withAlpha(70),
                              offset: const Offset(3.0, 10.0),
                              blurRadius: 15.0)
                        ]),
                    child: FrontCardPromo(product),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white.withOpacity(0.3),
                        //borderRadius: new BorderRadius.circular(20.0),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black.withAlpha(70),
                              offset: const Offset(3.0, 10.0),
                              blurRadius: 15.0)
                        ]),
                    child: BackCardPromo(product),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height *.065,
            width: MediaQuery.of(context).size.width *.835,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                //borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Ações',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 900,
                  height: double.maxFinite,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 10,
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 2,
                        bottom: 2,
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            splashColor: Colors.white, // inkwell color
                            child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.share,
                                  color: Colors.purple,
                                )),
                            onTap: () async {
                              showDialog(context: context,
                              builder: (context) => DialogSharePromo());
                            },
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 10,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *.01,
                          bottom: MediaQuery.of(context).size.height *.01,
                          left: MediaQuery.of(context).size.width *.000
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            splashColor: Colors.white, // inkwell color
                            child: SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.image,
                                  color: Colors.purple,
                                )),
                            onTap: () {
                              showDialog(context: context,
                                  builder: (context) => GaleryWidget(product));
                            },
                          ),
                        ),
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                        height: MediaQuery.of(context).size.height *.3,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width *.12,),
                        child: GridView(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *.01,
                            bottom: MediaQuery.of(context).size.height *.01,
                            left: MediaQuery.of(context).size.width *.02
                          ),
                          scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 0.5
                            ),
                          children: product.wants.map(
                              (s){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      want = s;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: s == want ? Colors.purple : Colors.grey[500],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(s,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil.instance.setSp(45),
                                    ),
                                    ),
                                  ),
                                );
                              }
                          ).toList(),
                        )),
                ),

              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height *.06,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Colors.white.withOpacity(0.3),
                //borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: want != null ?
                  (){
                if(UserModel.of(context).isLoggedIn()){

                  ProductListData productListData = ProductListData();
                  productListData.want = want;
                  productListData.quantity = 1;
                  productListData.pid = product.id;
                  productListData.category = product.category;
                  productListData.nomeLoja = product.nomeLoja;
                  productListData.productData = product;

                  ListModel.of(context).addListItem(productListData);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ListScreen())
                  );

                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>LoginScreen())
                  );
                }
              } : null,
              child: Text(UserModel.of(context).isLoggedIn() ? "Adicionar a Lista"
              : "Entre para adicionar",
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(50),
                ),
              ),
              color: Colors.purple,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
