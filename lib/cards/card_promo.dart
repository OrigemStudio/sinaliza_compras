import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/screens/promo_screen.dart';

class PromoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .10,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                  top: MediaQuery.of(context).size.height * .02,
                  bottom: MediaQuery.of(context).size.height * .02),
              child: new Text(
                'Descubra as melhores promoções e concorra a muitos prêmios',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(45)),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: new Stack(
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PromoScreen()));
                    },
                    child: new Container(
                      height: MediaQuery.of(context).size.height * .43,
                      width: MediaQuery.of(context).size.width * .9,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .015,
                      ),
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: new BorderRadius.circular(20.0),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withAlpha(70),
                                offset: const Offset(3.0, 10.0),
                                blurRadius: 15.0)
                          ]),
                      child: new Column(
                        children: <Widget>[
                          new Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 8.0,
                                  left: 14.0,
                                  right: 8.0),
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: new Border.all(
                                          color: Colors.grey.withAlpha(70),
                                          style: BorderStyle.solid,
                                          width:
                                          ScreenUtil.instance.setWidth(1)),
                                    ),
                                    child: new Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: new Icon(
                                        Icons.shopping_basket,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new Container(
                            child: Image.asset('assets/card_promo.gif'),
                            width: double.infinity,
                            height: ScreenUtil.instance.setHeight(590),
                            // color: Colors.white,
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01,
                                bottom:
                                MediaQuery.of(context).size.height * .01),
                            child: new Center(
                                child: new Text(
                                  'Promoções Diárias',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(55),
                                      color: Colors.white),
                                )),
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
      ),
    );
  }
}
