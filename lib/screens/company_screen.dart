import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/perfils_empresas/lojas_tab.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 8,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 8,
                expandedHeight: MediaQuery.of(context).size.height /3,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text("Perfis de Empresas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(40),
                      )),
                  background: Image.asset(
                    'assets/card_empresas.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: LojasTab(),
        ),
      ),
    );
  }
}
