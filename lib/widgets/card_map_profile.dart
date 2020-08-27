import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CardMapProfile extends StatefulWidget {
  final DocumentSnapshot snapshot;

  CardMapProfile(this.snapshot);

  @override
  _CardMapProfileState createState() => _CardMapProfileState(snapshot);
}

class _CardMapProfileState extends State<CardMapProfile> {
  final DocumentSnapshot snapshot;

  _CardMapProfileState(this.snapshot);

  _openWhatsapp() async {
    final whatsappUrl =
        "whatsapp://send?phone= +55 ${snapshot.data['whatsapp']}";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
    await launch(whatsappUrl);
  }

  _openFbMessenger() async {
    final messengerUrl = "https://${snapshot.data['messenger']}";
    await canLaunch(messengerUrl)
        ? launch(messengerUrl)
        : print(
            "open messenger app link or do a snackbar with notification that there is no whatsapp installed");
    await launch(messengerUrl);
  }

  _openFacebook() async {
    final facebookUrl = "https://${snapshot.data['facebook']}";
    await canLaunch(facebookUrl)
        ? launch(facebookUrl)
        : print(
            "open facebook app link or do a snackbar with notification that there is no whatsapp installed");
    await launch(facebookUrl);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .04,
        right: MediaQuery.of(context).size.width * .0,
        bottom: MediaQuery.of(context).size.height * .02,
      ),
      height: MediaQuery.of(context).size.height * .30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withAlpha(70),
                offset: const Offset(3.0, 10.0),
                blurRadius: 15.0)
          ]),
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            widget.snapshot.data['imageCapaProfile']))),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .05,
                left: MediaQuery.of(context).size.width * .001,
                child: Container(
                  height: MediaQuery.of(context).size.height * .14,
                  width: MediaQuery.of(context).size.width * .14,
                  child: Card(
                    // with Card
                    elevation: 4.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(snapshot.data['imageProfile']),
                    //child: Image.network(profileMap.imageProfile),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .13,
                bottom: MediaQuery.of(context).size.height * .02),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *.008
            ),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .25,
            child: Text(
              widget.snapshot.data['titleProfile'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.instance.setSp(35)),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.purple,
            height: MediaQuery.of(context).size.height * .005,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .025,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Horário de atendimento",
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(30)),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .025,
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.snapshot.data['time'],
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(35),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.purple,
            height: MediaQuery.of(context).size.height * .005,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .070,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 12,
                      child: FlatButton(
                          onPressed: _openWhatsapp,
                          child: Image.asset('assets/whatsapp.png'))),
                ),
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 20,
                      child: FlatButton(
                          onPressed: _openFbMessenger,
                          child: Image.asset('assets/facebook_messenger.png'))),
                ),
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 18,
                      width: MediaQuery.of(context).size.width / 18,
                      child: FlatButton(
                          onPressed: _openFacebook,
                          child: Image.asset('assets/facebook.png'))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
