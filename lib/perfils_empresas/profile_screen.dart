import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sinaliza_compras/datas/profile_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileData profile;

  ProfileScreen(this.profile);

  @override
  _ProfileScreenState createState() => _ProfileScreenState(profile);
}

class _ProfileScreenState extends State<ProfileScreen> {

  _openWhatsapp() async {
    final whatsappUrl ="whatsapp://send?phone= +55 ${profile.whatsapp}";
    await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
      await launch(whatsappUrl);

  }

  _openFbMessenger() async {
    final messengerUrl ="https://${profile.messenger}";
    await canLaunch(messengerUrl)? launch(messengerUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
    await launch(messengerUrl);

  }

  _sendMail() async {
    final emailurl = 'mailto:${profile.email}';
    if (await canLaunch(emailurl)) {
      await launch(emailurl);
    } else {
      throw 'Endereço de email não encontrado';
    }
  }

  final ProfileData profile;

  _ProfileScreenState(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 16,
                right: 16),
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            //topLeft: Radius.circular(20),
                            //topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black.withAlpha(70),
                              offset: const Offset(3.0, 10.0),
                              blurRadius: 30.0)
                        ],
                        image: DecorationImage(
                          image: NetworkImage(profile.imageCapa),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height *.005,
                      left: MediaQuery.of(context).size.width *.005,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 15,
                        child: BackButton(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height *.23,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.3,
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          left: 4
                        ),
                        child: Card(
                          // with Card
                          child: Image.network(profile.imageProfile),
                          elevation: 8.0,
                          shape: CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 16.3,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          profile.titleProfile,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14.3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 32, right: 8, top: 5),
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Sobre',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * .001,
                      color: Colors.purple,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.purple,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            top: 8,
                          ),
                          height: MediaQuery.of(context).size.height / 18,
                          child: Text(
                            profile.address,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, bottom: 16),
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        profile.city,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * .001,
                      color: Colors.purple,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.phone,
                            color: Colors.purple,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            top: 8,
                          ),
                          height: MediaQuery.of(context).size.height / 18,
                          child: Text(
                            profile.phone,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * .001,
                      color: Colors.purple,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height /22,
                          padding: const EdgeInsets.only(top: 12),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.purple,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 8,
                            ),
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              profile.about,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * .001,
                      color: Colors.purple,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 32, top: 5),
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Comunicação Online',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
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
                                height: MediaQuery.of(context).size.height / 16,
                                width: MediaQuery.of(context).size.width / 16,
                                child: FlatButton(
                                    onPressed: _openFbMessenger,
                                    child: Image.asset(
                                        'assets/facebook_messenger.png'))),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 8,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    size: 50,
                                    color: Colors.purple,
                                  ),
                                  onPressed: _sendMail),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * .001,
                      color: Colors.purple,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 32, top: 5),
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Publicações',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .60,
                      child: Card(
                        //shape: new RoundedRectangleBorder(
                            //borderRadius: new BorderRadius.circular(25.0)),
                        child: ListView(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: .77,
                              child: Carousel(
                                boxFit: BoxFit.cover,
                                images: profile.imagePost.map((url) {
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
                    Container(
                      height: MediaQuery.of(context).size.height *.05,
                      width: MediaQuery.of(context).size.width,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


