import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBrinde extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CardBrinde(this.snapshot);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .600,
        width: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .01,
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .03,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                  color: Colors.black.withAlpha(70),
                  offset: const Offset(3.0, 10.0),
                  blurRadius: 15.0)
            ]),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                height: MediaQuery.of(context).size.height *.06,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .008,
                  bottom: MediaQuery.of(context).size.height * .008,
                  left: MediaQuery.of(context).size.width * .002,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.purple,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .01,
                              bottom: MediaQuery.of(context).size.height * .01,
                              left: MediaQuery.of(context).size.width * .04),
                          child: Text(
                            snapshot.data['titleBrinde'],
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(45),
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child: Container(
                          child: Text("Status:"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .0,
                            right: MediaQuery.of(context).size.width * .04),
                        child: Container(
                          child: Text(
                            snapshot.data['status'],
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(45),
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .01),
              child: Container(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  snapshot.data['imageBrinde'],
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .18,
              child: ListView(
                children: <Widget>[
                  Text(
                    snapshot.data['descricao'],
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(40),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height *.015
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.purple,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .005,
                              bottom: MediaQuery.of(context).size.height * .005,
                              left: MediaQuery.of(context).size.width * .04),
                          child: Container(
                            child: Text(
                              'Data do sorteio:',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(45),
                                  color: Colors.white),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .005,
                            bottom: MediaQuery.of(context).size.height * .005,
                            right: MediaQuery.of(context).size.width * .04,
                          ),
                          child: Container(
                            child: Text(
                              snapshot.data['data'],
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(45),
                                  color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
