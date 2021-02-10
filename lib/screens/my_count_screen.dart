import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/screens/cart_screen.dart';

class MyCountScreen extends StatefulWidget {
  @override
  _MyCountScreenState createState() => _MyCountScreenState();
}

class _MyCountScreenState extends State<MyCountScreen> {

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
              SliverAppBar(
                elevation: 4,
                expandedHeight: MediaQuery.of(context).size.height *.3,
                floating: false,
                pinned: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.026,
                    ),
                    child: Text('Minha Conta',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(50),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Container(
                    color: Colors.purple.withOpacity(0.5),
                    height: MediaQuery.of(context).size.height *.15,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.05,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 40,
                          child: Container(
                            child: CircleAvatar(
                              maxRadius: 53,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                maxRadius: 50,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/lu.jpg',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 60,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *.08,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *.035,
                                  child: Text('Luciana Martins',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(50),
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Text('Endereço de Entrega',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil.instance.setSp(35),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('Rua:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil.instance.setSp(30),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Floriano Folharine, 397',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(30),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Bairro:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil.instance.setSp(30),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Vale Redentor 2',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(30),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Cidade:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil.instance.setSp(30),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('São José do Rio Pardo - SP',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(30),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Celular Cadastrado:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil.instance.setSp(30),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('## #####-####',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarCountDelegate(
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
                            'Estatística',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Carrinho',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Histórico',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Cartões Associados',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height *.400,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Estatística',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(95)),
                )),
              ),
              Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height *.400,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CartScreen()),
              ),
              Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height *.400,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Histórico',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(95)),
                )),
              ),
              Container(
                color: Colors.purple,
                height: MediaQuery.of(context).size.height *.400,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Cartões Associados',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(95)),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarCountDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarCountDelegate(this._tabBar);

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
  bool shouldRebuild(_SliverAppBarCountDelegate oldDelegate) {
    return false;
  }
}
