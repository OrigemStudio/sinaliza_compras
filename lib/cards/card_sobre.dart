import 'package:flutter/material.dart';

class CardSobre extends StatefulWidget {
  @override
  _CardSobreState createState() => _CardSobreState();
}
class _CardSobreState extends State<CardSobre> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        padding: const EdgeInsets.only(top: 120.0),
        color: Colors.purple,
        child: new Center(
          child: new Stack(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 12, bottom: 16.0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(20.0),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black.withAlpha(70),
                          offset: const Offset(3.0, 10.0),
                          blurRadius: 15.0)
                    ]),
                height: 300,
                width: 320,
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8.0, left: 8.0, right: 8.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color: Colors.grey.withAlpha(70),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                              ),
                              child: new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.shopping_basket),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                alignment: Alignment.topRight,
                                child: new Material(
                                  color: Colors.transparent,
                                  type: MaterialType.transparency,
                                  child: new IconButton(
                                    icon: new Icon(Icons.more_vert, color: Colors.grey,),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Center(
                      child: Container(
                        color: Colors.deepOrange,
                        width: double.infinity,
                        height: 180,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 8.0, right: 8.0),
                      child: new Center(
                          child: new Text(
                            'Sobre o Aplicativo',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}