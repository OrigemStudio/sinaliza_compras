import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinaliza_compras/datas/product_data.dart';

class ProductListData {

  String cid;

  String category;
  String nomeLoja;
  String title;
  String description;
  String pid;

  int quantity;

  double price;

  List imageGallery;

  String want;
  String cupom;
  String cupomDesc;

  ProductData productData;

  ProductListData();

  ProductListData.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    title = document.data["title"];
    description = document.data["description"];
    price = document.data["price"];
    imageGallery = document.data["imageGallery"];
    cupom = document.data["cupom"];
    cupomDesc = document.data["cupomDesc"];
    category = document.data["category"];
    nomeLoja = document.data["nomeLoja"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    want = document.data["want"];

  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "nomeLoja" : nomeLoja,
      "product": productData.toResumedMap()
    };
  }
}