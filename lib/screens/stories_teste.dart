import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/screens/promo_screen.dart';

class StoriesTeste extends StatefulWidget {
  final DocumentSnapshot snapshot;

  StoriesTeste(this.snapshot);

  @override
  _StoriesTesteState createState() => _StoriesTesteState(this.snapshot);
}

class _StoriesTesteState extends State<StoriesTeste> {
  final DocumentSnapshot snapshot;

  _StoriesTesteState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    Widget itensCard = new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('cidades')
            .document('Rio Pardo')
            .collection('product')
            .document("Lojas")
            .collection('cliente')
            .document(snapshot.documentID)
            .collection('story')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return new Text(
                'Error in receiving trip photos: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Not connected to the Stream or null');

            case ConnectionState.waiting:
              return new Text('Awaiting for interaction');

            case ConnectionState.active:
              print("Stream has started but not finished");

              var totalPhotosCount = 0;
              List<DocumentSnapshot> listCard;

              if (snapshot.hasData) {
                listCard = snapshot.data.documents;
                totalPhotosCount = listCard.length;

                if (totalPhotosCount > 0) {
                  return new GridView.builder(
                      itemCount: totalPhotosCount,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height),
                              crossAxisCount: 8),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PromoScreen()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(
                                              listCard[index]['image'])),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: .8, left: .8),
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 0.5,
                                                width: 0.5,
                                                child: CircleAvatar(
                                                  radius: 08,
                                                  backgroundImage:
                                                  NetworkImage(listCard[
                                                  index]
                                                  ['imageProfile']),
                                                )),
                                            Container(
                                              height: 0.15,
                                              padding:
                                              EdgeInsets.only(left: .4),
                                              child: Text(
                                                listCard[index]
                                                ['titleProfile'],
                                                style:
                                                TextStyle(fontSize: 02),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            .015,
                                      ),
                                      Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            .02,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width,
                                        padding: EdgeInsets.all(.2),
                                        child: Center(
                                          child: Text(
                                            listCard[index]['description'],
                                            style: TextStyle(fontSize: 02),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              }

              return new Center(
                  child: Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                  ),
                  new Text(
                    "Imagens não encontradas.",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ));

            case ConnectionState.done:
              return new Text('Streaming is done');
          }

          return Container(
            child: new Text("No trip photos found."),
          );
        });

    return Scaffold(
      backgroundColor: Colors.purple,
      body: new Container(
        child: itensCard,
      ),
    );
  }
}
