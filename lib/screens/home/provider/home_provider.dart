import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_mgt/screens/home/model/home.model.dart' as model;

class HomeProvider with ChangeNotifier {

String image = '';
 final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  //===============add data to the firebase===========//
  Future creatUser(name, number) async {
    final docUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc();
    final user =
        model.User(id: docUser.id, name: name, number: number, image: image);
    final json = user.toJson();
    await docUser.set(json);
          image='';
          notifyListeners();
  }
  //================get data from the firebase=========//

  Stream<List<model.User>> readUser() {
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => model.User.fromJson(doc.data()))
            .toList());
  }
//==================get image from gallery==================//
  pickimage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    } else {
      final bytes = File(img.path).readAsBytesSync();
      image = base64Encode(bytes);
      notifyListeners();
    }
  }
   //*********name validaton*************//
  nameValidate(String value) {
    if (value.isEmpty) {
      return 'pleas enter name';
    }
    return null;
  }
  //=================password validate==============//
  passwordvalidate(String value){
    if (value.isEmpty) {
      return 'pleas enter number';
    }
    return null;
  }
  
  //===================form validation========//
  validate( BuildContext context) async {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      Navigator.pop(context);
      await creatUser(namecontroller.text.trim(), numbercontroller.text.trim());
      
      namecontroller.clear();
      numbercontroller.clear();
      notifyListeners();
    }
    
  }     
}

