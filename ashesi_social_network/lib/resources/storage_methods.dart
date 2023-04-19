import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageData {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //storing image to firebase
  Future<String> uploadImgToFirebase(
      String childName, Uint8List fileName, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(fileName);

    TaskSnapshot takeSnap = await uploadTask;
    String URL = await takeSnap.ref.getDownloadURL();
    return URL;
  }
}
