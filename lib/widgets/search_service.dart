import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('cidades')
        .document('Rio Pardo')
        .collection('stories')
        .where('Hashtag',
        isEqualTo: searchField.substring(1, 0).toUpperCase())
        .getDocuments();
  }
}

class Alldata {
  getAllData() {
    return Firestore.instance
        .collection('cidades')
        .document('Rio Pardo')
        .collection('stories')
        .where('Hashtag')
        .getDocuments();
  }
}