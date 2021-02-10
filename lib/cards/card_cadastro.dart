import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/screens/login_screen.dart';

class CardCadastro extends StatefulWidget {
  @override
  _CardCadastroState createState() => _CardCadastroState();
}

class _CardCadastroState extends State<CardCadastro> {
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
                'Cadastre-se e concorra a prémios todo mês!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(45)),
                textAlign: TextAlign.center,
              ),
            ),
            new Center(
              child: new Stack(
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) =>
                          new LoginScreen(),
                          transitionsBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child,
                              ) {
                            return new SlideTransition(
                              position: new Tween<Offset>(
                                begin: const Offset(-1.0, 1.0),
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
                          transitionDuration:
                          const Duration(milliseconds: 200)));
                    },
                    child: new Container(
                      height: MediaQuery.of(context).size.height *.43,
                      width: MediaQuery.of(context).size.width *.9,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *.015,
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
                                        Icons.face,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new Container(
                            child: Image.asset('assets/card_cadastrar.gif'),
                            width: double.infinity,
                            height: ScreenUtil.instance.setHeight(590),
                            // color: Colors.white,
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    .01,
                                bottom: MediaQuery.of(context).size.height *
                                    .01),
                            child: new Center(
                                child: new Text(
                                  'Cadastrar',
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
