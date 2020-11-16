import 'package:cloud_firestore/cloud_firestore.dart';

class StoriesData {

  String description;
  String image;
  String imageProfile;
  String titleProfile;
  String id;
  //String hashtag;


  StoriesData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    description = snapshot.data["description"];
    image = snapshot.data["image"];
    imageProfile = snapshot.data["imageProfile"];
    titleProfile = snapshot.data["titleProfile"];
    //titleProfile = snapshot.data["hashtag"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "description": description,
      "image": image,
      "imageProfile": imageProfile,
      "titleProfile": titleProfile,
      //"hashtag": hashtag,
    };
  }

}