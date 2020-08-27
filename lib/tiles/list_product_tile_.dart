import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_compras/datas/product_data.dart';
import 'package:sinaliza_compras/datas/product_list_data.dart';
import 'package:sinaliza_compras/model/list_model.dart';

class ListProductTile extends StatelessWidget {

  final ProductListData productListData;

  ListProductTile(this.productListData);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()
      ..init(context);
    Widget _buildContent() {
      ListModel.of(context).updatePrices();

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              productListData.productData.imageGallery[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    productListData.productData.nomeLoja,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil.instance.setSp(40)),
                  ),
                  Text(
                    productListData.productData.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil.instance.setSp(40)),
                  ),
                  Text(
                    "Adicionado em: ${formatDate(
                        DateTime.now(), [
                      dd, '/',
                      mm, '/',
                      yyyy,
                    ])}",
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(30)),
                  ),
                  Text(
                    "R\$ ${productListData.productData.price.toStringAsFixed(
                        2)}",
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: productListData.quantity > 1 ?
                            () {
                          ListModel.of(context).decProduct(productListData);
                        } : null,
                      ),
                      Text(productListData.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: () {
                          ListModel.of(context).incProduct(productListData);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: () {
                          ListModel.of(context).removeListItem(productListData);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: productListData.productData == null ?
        FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance.collection("product").document(
              productListData.category)
              .collection("cliente")
              .document()
          .collection("anuncio")
          .document(productListData.pid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data == null || snapshot.data.data == null){
                return Container(
                  height: MediaQuery.of(context).size.height *.08,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.035
                  ),
                  child: Text('Nenhum produto adcionado',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                print(snapshot.data.data);
                productListData.productData =
                    ProductData.fromDocument(snapshot.data);
                return _buildContent();
              }
            } else {
              return Container(
                height: 70.0,
                child: CircularProgressIndicator(),
                alignment: Alignment.center,
              );
            }
          },
        ) :
        _buildContent()
    );
  }

}