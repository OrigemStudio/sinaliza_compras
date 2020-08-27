import 'package:flutter/material.dart';

import 'list_screen.dart';

class ListConfirmScreen extends StatelessWidget {

  final String orderId;

  ListConfirmScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item adicionado a Lista"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80.0,
            ),
            Text("Produto enviado para a lista com sucesso!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text("Código do produto: $orderId", style: TextStyle(fontSize: 16.0),
            ),
            new Container(
              width: 50,
              height: 50,
            ),
            Text(
              "Você pode encontrar os produtos adicionados a lista, indo para 'Minhas Listas' na tela inicial do app!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height /20,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height /10,
              width: MediaQuery.of(context).size.width / 2,
              child: Text("Ou acesse sua lista agora mesmo!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.purple,
              ),
              child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListScreen())
                    );
                  },
                  child: Text('Acessar Lista',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

