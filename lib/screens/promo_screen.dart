import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/screens/atalho_list_screen.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_assistencia.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_construcao.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_foods.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_lojas.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_pets.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_saude.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_super.dart';
import 'package:sinaliza_compras/widgets/title_list_promo_viagem.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreen createState() => new _PromoScreen();
}

class _PromoScreen extends State<PromoScreen> {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 8,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 4,
                expandedHeight: MediaQuery.of(context).size.height / 3,
                floating: false,
                pinned: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AtalhoListScreen()));
                      }),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text("Promoções Diárias",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(40),
                      )),
                  background: Image.asset('assets/card_promo02.gif'),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorWeight: 1.0,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(
                            'Lojas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Cuidado com Animais',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Supermercados',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Alimentação',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Assistência Técnica',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Viagem e Turismo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Construção Civil',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Saúde e Bem Estar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Lojas")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoLojas(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Cuidado com Animais")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoPets(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Supermercados")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoSuper(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Alimentação")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoFoods(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Assistência Técnica")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoAssistencia(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Viagem e Turismo")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoViagem(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Construção Civil")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoConstrucao(doc);
                          }).toList()),
                        );
                      }
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('cidades')
                        .document('Rio Pardo')
                        .collection('product')
                        .document("Saúde e Bem Estar")
                        .collection('cliente')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Container(
                          color: Colors.purple[100],
                          child: ListView(
                              children: snapshot.data.documents.map((doc) {
                            return TitleListPromoSaude(doc);
                          }).toList()),
                        );
                      }
                    }),
              ]),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.purple,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
