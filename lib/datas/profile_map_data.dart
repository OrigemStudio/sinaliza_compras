import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileMapData {

  String category;
  String id;

  String imageCapaProfile;
  String imageProfile;

  String titleProfile;

  String time;

  String whatsapp;
  String messenger;
  String facebook;

  ProfileMapData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    imageCapaProfile = snapshot.data['imageCapaProfile'];
    imageProfile = snapshot.data['imageProfile'];
    titleProfile = snapshot.data['titleProfile'];
    time = snapshot.data['time'];
    whatsapp = snapshot.data['whatsapp'];
    messenger = snapshot.data['messenger'];
    facebook = snapshot.data['facebook'];
  }

  Map<String, dynamic> toResumeMap() {
    return {
      'imageCapaProfile' : imageCapaProfile,
      'imageProfile' : imageProfile,
      'titleProfile' : titleProfile,
      'time' : time,
      'whatsapp' : whatsapp,
      'messenger' : messenger,
      'facebook' : facebook,
    };
  }

}