import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/tabs/fixed_list_lojas_tab.dart';



class ListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 4,
                expandedHeight: MediaQuery.of(context).size.height / 3,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                    "Minhas Listas",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(40),
                    ),
                  ),
                  background: Image.asset(
                    'assets/card_list_buy2.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ];
          },
          body: FixedListLojasTab(),
        ),
      ),
    );
  }
}
