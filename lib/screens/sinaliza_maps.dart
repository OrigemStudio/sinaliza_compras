import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sinaliza_compras/cards/slide_screen.dart';
import 'package:sinaliza_compras/widgets/card_map_profile.dart';

class SinalizaMaps extends StatefulWidget {

  @override
  SinalizaMapsState createState() => SinalizaMapsState();
}

class SinalizaMapsState extends State<SinalizaMaps> {

  String _mapStyle;

  Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .62,
                  left: MediaQuery.of(context).size.width * .02),
              child: _zoomminusfunction()),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .62,
                  right: MediaQuery.of(context).size.width * .02),
              child: _zoomplusfunction()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: MediaQuery.of(context).size.width * 10,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black.withAlpha(70),
                            offset: const Offset(-3.0, -10.0),
                            blurRadius: 15.0)
                      ]),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .008),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * .45,
                            width: MediaQuery.of(context).size.width * .48,
                            padding: EdgeInsets.all(4),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                      width: MediaQuery.of(context).size.width *
                                          .1,
                                      child: Image.asset(
                                          'assets/sinaliza_notification.png'),
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *.02
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .04,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .35,
                                        child: Text(
                                          'Sinaliza Delivery',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ScreenUtil.instance.setSp(45),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .01,
                                      left: MediaQuery.of(context).size.width *
                                          .03,
                                      right: MediaQuery.of(context).size.width *
                                          .02),
                                  height:
                                      MediaQuery.of(context).size.height * .001,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    'Escolha aqui antes de fazer seu pedido!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(35),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .002,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                      left: MediaQuery.of(context).size.width *
                                          .02,
                                      right: MediaQuery.of(context).size.width *
                                          .02),
                                  height:
                                      MediaQuery.of(context).size.height * .001,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *.004
                                  ),
                                  child: Text(
                                    'Encontre muito mais no Sinaliza Compras!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(35),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .01),
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      elevation: 0.4,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SlideScreen(),
                                            ));
                                      },
                                      child: Text('Acessar')),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              //_gotoLocation(lat, long)
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * .5,
                              child: FutureBuilder<QuerySnapshot>(
                                  future: Firestore.instance
                                      .collection('cidades')
                                      .document('Rio Pardo')
                                      .collection('Maps')
                                  .document('Delivery')
                                  .collection('Cliente')
                                      .getDocuments(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData)
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    else {
                                      return Container(
                                        //color: Colors.white,
                                        height: MediaQuery.of(context).size.height * .35,
                                        width: MediaQuery.of(context).size.width * .50,
                                        child: ListView(
                                            children: snapshot.data.documents
                                                .map((doc) {
                                          return CardMapProfile(doc);
                                        }).toList()),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Colors.purple),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Colors.purple),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(-21.605837, -46.898916), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(-21.605837, -46.898916), zoom: zoomVal)));
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
        CameraPosition(target: LatLng(-21.605837, -46.898916), zoom: 14),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          //_controller = controller;
          //_controller.setMapStyle(_mapStyle);
        },
        markers: {
          newyork1Marker,
          newyork2Marker,
          newyork3Marker,
          gramercyMarker,
          bernardinMarker,
          blueMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

}

Marker gramercyMarker = Marker(
  markerId: MarkerId('Carlos e Edgar Hortifrutti'),
  position: LatLng(-21.610415, -46.914549),
  infoWindow: InfoWindow(title: 'Carlos e Edgar Hortifrutti'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png',),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('Zap Doce Festa'),
  position: LatLng(-21.598293, -46.891054),
  infoWindow: InfoWindow(title: 'Zap Doce Festa'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png'),
);

Marker blueMarker = Marker(
  markerId: MarkerId('Bom Tropeiro Restaurante'),
  position: LatLng(-21.602738, -46.892291),
  infoWindow: InfoWindow(title: 'Bom Tropeiro Restaurante'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png'),
);

Marker newyork1Marker = Marker(
  markerId: MarkerId('Seu Divino'),
  position: LatLng(-21.605719, -46.893484),
  infoWindow: InfoWindow(title: 'Seu Divino'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png'),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('Curva do Peixe'),
  position: LatLng(-21.603523, -46.888026),
  infoWindow: InfoWindow(title: 'Curva do Peixe'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png'),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('Costela Grill Gastrobar '),
  position: LatLng(-21.603423, -46.892816),
  infoWindow: InfoWindow(title: 'Costela Grill Gastrobar'),
  icon: BitmapDescriptor.fromAsset('assets/marcador_sinaliza.png'),
);
