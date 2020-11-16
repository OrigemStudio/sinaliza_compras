import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('clients')
        .where('searchKey',
        isEqualTo: searchField.substring(1, 0).toUpperCase())
        .getDocuments();
  }
}