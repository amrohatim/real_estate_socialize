import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFirestoreRepo {
  final FirebaseFirestore _firestore;

  MyFirestoreRepo(this._firestore);
  Future<void> addinfo(String price, String bedRooms, String location) async {
    final docref = await _firestore
        .collection("types")
        .doc("Flat")
        .collection("Sale")
        .add({"Location": location, "BedRooms": bedRooms, "Price": price});
    debugPrint(docref.id);
  }

  Query<Map<String, dynamic>> getuser() {
    return _firestore.collection('new');
  }
}

final myfireprovider = Provider<MyFirestoreRepo>((ref) {
  return MyFirestoreRepo(FirebaseFirestore.instance);
});

final firebaseauthprovider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
