import 'package:flutter/material.dart';

class DialogSharePromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2.5,
        child: Card(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 16),
            child: ClipRect(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 96, bottom: 6),
                          child: Text(
                            'Compartilhar',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.purple),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 0,
                          child: Container(
                            child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');
                                }),
                          ))
                    ],
                  ),
                  Divider(
                    height: 10,
                    color: Colors.purple,
                  ),
                  Container(
                    //color: Colors.black45,
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: MediaQuery.of(context).size.height /14,
                                padding: const EdgeInsets.all(4),
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Image.asset('assets/whatsapp.png')),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: MediaQuery.of(context).size.height /14,
                                padding: const EdgeInsets.all(8),
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Image.asset('assets/facebook_messenger.png')),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: MediaQuery.of(context).size.height /14,
                                padding: const EdgeInsets.all(0),
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Image.asset('assets/facebook.png')),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: MediaQuery.of(context).size.height /14,
                                padding: const EdgeInsets.only(
                                  top: 32,
                                  left: 0,
                                ),
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Image.asset('assets/Instagram.png')),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Funcionalidade em desenvolvimento. Por favor, retorne em breve!',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
