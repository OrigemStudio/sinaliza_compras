import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/cards/card_promo.dart';
import 'package:sinaliza_compras/model/user_model.dart';
import 'package:sinaliza_compras/screens/choose_city.dart';
import 'package:sinaliza_compras/screens/login_screen.dart';
import 'package:sinaliza_compras/screens/my_count_screen.dart';
import 'package:sinaliza_compras/screens/sobre_screen.dart';
import 'package:sinaliza_compras/screens/stories_screen.dart';
import 'package:sinaliza_compras/screens/stories_screen2.dart';
import '../CustomIcons.dart';
import 'card_brinde_sinaliza.dart';
import 'card_cadastro.dart';
import 'card_empresas.dart';
import 'card_list_buy.dart';
import 'card_evento.dart';

class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  var left = 0.0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: new AppBar(
        elevation: 6.0,
        backgroundColor: Colors.white.withOpacity(0.3),
        title: Image.asset('assets/sinaliza_launch.png',
          scale: 3.6,
        ),
        centerTitle: true,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width *.40,
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>MyCountScreen())
                );
              },
              child: Row(
                children: [
                  Text('Minha conta',
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(35),
                        color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width *.02
                    ),
                    child: CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/profile.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        leading: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            child: new Icon(
              CustomIcons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  new SobreScreen(),
                  transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                      ) {
                    return new SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(-1.0, -1.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: new SlideTransition(
                        position: new Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(0.0, 1.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 200)));
            }),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.pinkAccent,
            primaryColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white54))),
        child: new Stack(
          children: <Widget>[
            CurvedNavigationBar(
              index: 0,
              height: 55.0,
              onTap: (p) {
                _pageController.animateToPage(p,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              items: [
                Icon(Icons.shopping_basket, size: 30, color: Colors.white),
                Icon(Icons.home, size: 30, color: Colors.white),
                Icon(Icons.calendar_today, size: 30, color: Colors.white),
                Icon(Icons.card_giftcard, size: 30, color: Colors.white),
                Icon(Icons.face, size: 30, color: Colors.white),
                Icon(Icons.list, size: 30, color: Colors.white),
              ],
              color: Colors.white.withOpacity(0.3),
              buttonBackgroundColor: Colors.transparent,
              backgroundColor: Colors.purple,
              animationCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
      body: new NotificationListener(
        // ignore: missing_return
        onNotification: (v) {
          if (v is ScrollUpdateNotification)
            setState(() => left -= v.scrollDelta / 2);
        },
        child: Stack(
          children: <Widget>[
            new Positioned(
              left: left,
              child: new Container(
                height: MediaQuery.of(context).size.height / 1.18,
                width: MediaQuery.of(context).size.width / 0.333,
                child: new Image.asset(
                  'assets/fundo_parallax_sinaliza.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SafeArea(
              child: PageView(
                controller: _pageController,
                onPageChanged: (p) {
                  setState(() {});
                },
                children: <Widget>[
                  PromoCard(),
                  CardEmpresas(),
                  CardEvento(),
                  CardBrindeSinaliza(),
                  CardCadastro(),
                  CardListBuy(),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * .23,
                        width: MediaQuery.of(context).size.width * .88,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .06,
                          right: MediaQuery.of(context).size.width * .01,
                          top: MediaQuery.of(context).size.height * .55,
                          bottom: MediaQuery.of(context).size.height * .00,
                        ),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(20.0),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black.withAlpha(70),
                                  offset: const Offset(3.0, 10.0),
                                  blurRadius: 15.0)
                            ]),
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            return Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .06,
                                          right: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .05,
                                          top: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .030,
                                        ),
                                        child: Text(
                                          "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                          style: TextStyle(
                                              fontSize:
                                              ScreenUtil.instance.setSp(35),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                .size
                                                .width *
                                                .06,
                                            right: MediaQuery.of(context)
                                                .size
                                                .width *
                                                .06,
                                          ),
                                          child: Text(
                                            !model.isLoggedIn()
                                                ? "Entre ou cadastre-se >"
                                                : "Sair",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: ScreenUtil.instance
                                                    .setSp(35),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onTap: () {
                                          if (!model.isLoggedIn())
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()));
                                          else
                                            model.signOut();
                                        },
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                .size
                                                .width *
                                                .06,
                                            right: MediaQuery.of(context)
                                                .size
                                                .width *
                                                .05,
                                            top: MediaQuery.of(context)
                                                .size
                                                .height *
                                                .015,
                                          ),
                                          child: Text('Você está em:',
                                            style: TextStyle(
                                                fontSize:
                                                ScreenUtil.instance.setSp(35),
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .06,
                                          right: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .05,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Text('São José do Rio Pardo',
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontSize:
                                                ScreenUtil.instance.setSp(35),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * .06,
                                          width: MediaQuery.of(context).size.width * .35,
                                          margin: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.height *.02
                                          ),
                                          child: FlatButton(
                                            onPressed: (){
                                              Navigator.push(
                                                  context, MaterialPageRoute(
                                                  builder: (context) => ChooseCity()
                                              ));
                                            },
                                            color: Colors.purple,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(30.0)),
                                            child: Text('Escolher região',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                  ScreenUtil.instance.setSp(35),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.purple,
                                  height: MediaQuery.of(context).size.height * .20,
                                  width: MediaQuery.of(context).size.width * .003,
                                ),
                                Expanded(
                                  flex: 60,
                                  child: Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StoriesScreen2(),
                                              ));
                                        },
                                        child: Image.asset(
                                          'assets/sinaliza_stories.gif',
                                          scale: 01.52,
                                          fit: BoxFit.none,
                                        )),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
