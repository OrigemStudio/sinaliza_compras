import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileData {

  String category;
  String id;

  String imageEnterProfile;
  String titleEnterProfile;

  String titleProfile;
  String description;

  String address;
  String city;
  String phone;
  String about;
  String whatsapp;
  String messenger;
  String email;

  String imageCapa;
  String imageProfile;
  List imagePost;

  ProfileData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    imageEnterProfile = snapshot.data['imageEnterProfile'];
    titleEnterProfile = snapshot.data['titleEnterProfile'];
    titleProfile = snapshot.data['titleProfile'];
    description = snapshot.data['description'];
    address = snapshot.data['address'];
    imageCapa = snapshot.data['imageCapa'];
    imageProfile = snapshot.data['imageProfile'];
    imagePost = snapshot.data['imagePost'];
    city = snapshot.data['city'];
    phone = snapshot.data['phone'];
    about = snapshot.data['about'];
    whatsapp = snapshot.data['whatsapp'];
    messenger = snapshot.data['messenger'];
    email = snapshot.data['email'];
  }

  Map<String, dynamic> toResumeMap() {
    return {
      'imageEnterProfile' : imageEnterProfile,
      'titleEnterProfile' : titleEnterProfile,
      'titleProfile' : titleProfile,
      'description' : description,
      'address' : address,
      'imageCapa' : imageCapa,
      'imageProfile' : imageProfile,
      'imagePost' : imagePost,
      'city' : city,
      'phone' : phone,
      'about' : about,
      'whatsapp' : whatsapp,
      'messenger' : messenger,
      'email' : email,
    };
  }

}