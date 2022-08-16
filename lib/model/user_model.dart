import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? phoneNumber;


  UserModel({this.uid,this.email,this.phoneNumber,this.firstname,this.lastname });

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'] ?? " ",
      email: map['email'] ?? " ",
      firstname: map['firstname'] ?? " ",
      lastname: map['lastname'] ?? " ",
      phoneNumber: map['phoneNumber'] ?? " ",
   
    );
  }
  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname':firstname,
      'lastname':lastname,
      'phoneNumber': phoneNumber,

    };
  }

}