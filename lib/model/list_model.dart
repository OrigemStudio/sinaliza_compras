import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:sinaliza_compras/datas/product_list_data.dart';
import 'package:sinaliza_compras/model/user_model.dart';

class ListModel extends Model {
  UserModel user;

  List<ProductListData> product = [];

  String couponCode;
  int discountPercentage = 0;

  bool isLoading = false;

  ListModel(this.user) {
    if (user.isLoggedIn()) _loadListItems();
  }

  static ListModel of(BuildContext context) =>
      ScopedModel.of<ListModel>(context);

  void addListItem(ProductListData productListData) {
    product.add(productListData);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(productListData.toMap())
        .then((doc) {
      productListData.cid = doc.documentID;
    });

    notifyListeners();
  }

  void removeListItem(ProductListData productListData) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(productListData.cid)
        .delete();

    product.remove(productListData);

    notifyListeners();
  }

  void decProduct(ProductListData productListData) {
    productListData.quantity--;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(productListData.cid)
        .updateData(productListData.toMap());

    notifyListeners();
  }

  void incProduct(ProductListData productListData) {
    productListData.quantity++;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(productListData.cid)
        .updateData(productListData.toMap());

    notifyListeners();
  }

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }

  void updatePrices() {
    notifyListeners();
  }

  double getProductsPrice() {
    double price = 0.0;
    for (ProductListData c in product) {
      if (c.productData != null) price += c.quantity * c.productData.price;
    }
    return price;
  }

  double getDiscount() {
    return getProductsPrice() * discountPercentage / 100;
  }

  double getShipPrice() {
    return 0.00;
  }

  Future<String> finishOrder() async {
    if (product.length == 0) return null;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice();
    double discount = getDiscount();

    DocumentReference refOrder =
        await Firestore.instance.collection("orders").add({
      "clientId": user.firebaseUser.uid,
      "product": product.map((productListData) => productListData.toMap()).toList(),
      "shipPrice": shipPrice,
      "productsPrice": productsPrice,
      "discount": discount,
      "totalPrice": productsPrice - discount + shipPrice,
      "status": 1
    });

    await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("orders")
        .document(refOrder.documentID)
        .setData({"orderId": refOrder.documentID});

    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    for (DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    product.clear();

    couponCode = null;
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();

    return refOrder.documentID;
  }

  void _loadListItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    product =
        query.documents.map((doc) => ProductListData.fromDocument(doc)).toList();

    notifyListeners();
  }
}
