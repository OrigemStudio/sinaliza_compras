import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/CustomIcons.dart';

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {

  bool rioPardo = false;
  bool mococa = false;
  bool sjBoavista = false;
  bool casaBranca = false;
  bool vgdoSul = false;
  bool pocoDeCaldas = false;
  bool franciscoBeltrao = false;
  bool patoBranco = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var size = MediaQuery
        .of(context)
        .size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 1) / 2.18;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Escolha sua cidade',
          style: TextStyle(
            fontSize: ScreenUtil.instance.setSp(55)
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                child: Icon(Icons.location_on, color: Colors.purple,),
              ),
              title: Text('São Paulo',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(CustomIcons.menu, color: Colors.purple,),
              children: [
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: rioPardo,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = value;
                        mococa = false;
                        sjBoavista = false;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = false;
                        franciscoBeltrao = false;
                        patoBranco = false;
                      });
                    },
                  ),
                  Text("São José do Rio Pardo"),
                ]),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: mococa,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = false;
                        mococa = value;
                        sjBoavista = false;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = false;
                        franciscoBeltrao = false;
                        patoBranco = false;
                      });
                    },
                  ),
                  Text("Mococa"),
                ]),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: sjBoavista,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = false;
                        mococa = false;
                        sjBoavista = value;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = false;
                        franciscoBeltrao = false;
                        patoBranco = false;
                      });
                    },
                  ),
                  Text("São João da Boa Vista"),
                ]),
              ],
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                child: Icon(Icons.location_on, color: Colors.purple,),
              ),
              title: Text('Minas Gerais',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(CustomIcons.menu, color: Colors.purple,),
              children: [
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: pocoDeCaldas,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = false;
                        mococa = false;
                        sjBoavista = false;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = value;
                        franciscoBeltrao = false;
                        patoBranco = false;
                      });
                    },
                  ),
                  Text("Poços de Caldas"),
                ]),
              ],
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                child: Icon(Icons.location_on, color: Colors.purple,),
              ),
              title: Text('Paraná',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(CustomIcons.menu, color: Colors.purple,),
              children: [
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: franciscoBeltrao,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = false;
                        mococa = false;
                        sjBoavista = false;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = false;
                        franciscoBeltrao = value;
                        patoBranco = false;
                      });
                    },
                  ),
                  Text("Francisco Beltrão"),
                ]),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Row(children: <Widget>[
                  Switch(
                    activeColor: Colors.purple,
                    value: patoBranco,
                    onChanged: (bool value) {
                      setState(() {
                        rioPardo = false;
                        mococa = false;
                        sjBoavista = false;
                        casaBranca = false;
                        vgdoSul = false;
                        pocoDeCaldas = false;
                        franciscoBeltrao = false;
                        patoBranco = value;
                      });
                    },
                  ),
                  Text("Pato Branco"),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
