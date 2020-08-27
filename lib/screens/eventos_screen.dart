import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventoScreen extends StatefulWidget {
  @override
  _EventoScreenState createState() => _EventoScreenState();
}

class _EventoScreenState extends State<EventoScreen> {

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 10,
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
                  title: Text("Eventos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(40),
                      )),
                  background: Image.asset('assets/card_eventos.gif',
                  fit: BoxFit.cover,
                  ),),
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
                            'Balada',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Cultural',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Infantil',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Inauguração',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Bazar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Curso Livre',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Esportivo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Comemoração',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Natureza',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(45)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Exposição',
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
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.brown,
              ),
              Container(
                color: Colors.black12,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.pink,
              ),
            ],
          ),
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