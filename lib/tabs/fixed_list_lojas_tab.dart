import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/model/list_model.dart';
import 'package:sinaliza_compras/model/user_model.dart';
import 'package:sinaliza_compras/screens/list_confirm_screen.dart';
import 'package:sinaliza_compras/screens/login_screen.dart';
import 'package:sinaliza_compras/tiles/list_product_tile_.dart';
import 'package:sinaliza_compras/widgets/list_price.dart';

class FixedListLojasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ListModel>(builder: (context, child, model) {
        if (model.isLoading && UserModel.of(context).isLoggedIn()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!UserModel.of(context).isLoggedIn()) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.list,
                  size: 80.0,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Faça o login para adicionar produtos!",
                  style:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),

                /// Botão Login, para quando o usuária tentar ver a pré lista e não estiver logado
                RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    "Entrar",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                )
              ],
            ),
          );
        } else if (model.product == null || model.product.length == 0) {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width * .8,
              child: Text(
                "Nenhum produto ou serviço na sua lista!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
              Column(
                children: model.product.map((product) {
                  return ListProductTile(product);
                }).toList(),
              ),
              ListPrice(() async {
                String orderId = await model.finishOrder();
                if (orderId != null)
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ListConfirmScreen(orderId)));
              }),
            ],
          );
        }
      });

  }
}
