import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;
  String id;
  String nomeLoja;
  String unit;
  String pid;

  int quantity;

  String title;
  String description;

  double price;

  List imageGallery;
  String cupom;
  String cupomDesc;
  List wants;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    imageGallery = snapshot.data["imageGallery"];
    category = snapshot.data["category"];
    nomeLoja = snapshot.data["nomeLoja"];
    unit = snapshot.data["unit"];
    cupom = snapshot.data["cupom"];
    cupomDesc = snapshot.data["cupomDesc"];
    wants = snapshot.data["wants"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "title": title,
      "description": description,
      "price": price,
      "imageGallery" : imageGallery,
      "cupom" : cupom,
      "cupomDesc" : cupomDesc,
      "category" : category,
      "nomeLoja" : nomeLoja,
      "unit" : unit,
      "want" : wants,
    };
  }

}