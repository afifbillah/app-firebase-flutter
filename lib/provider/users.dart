import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  TextEditingController firstnameC = TextEditingController();
  TextEditingController lastnameC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  void addUser() {
    if (firstnameC.text.isNotEmpty &&
        lastnameC.text.isNotEmpty &&
        ageC.text.isNotEmpty) {
      CollectionReference users = db.collection("users");
      users.add({
        'firstname': firstnameC.text,
        'lastname': lastnameC.text,
        'age': ageC.text
      });

      firstnameC.clear();
      lastnameC.clear();
      ageC.clear();
    } else {
      print("Salah Satu data Kosong");
    }
  }

  Future<QuerySnapshot<Object?>> getUsers() async {
    CollectionReference users = db.collection("users");
    return await users.get();
  }

  Stream<QuerySnapshot<Object?>> streamUsers() {
    CollectionReference users = db.collection("users");
    return users.snapshots();
  }

  // Proses Edit

  Future<DocumentSnapshot<Object?>> getUserByIdDoc(String id) {
    DocumentReference docref = db.collection("users").doc(id);
    return docref.get();
  }

  void updateUser(String id) {
    DocumentReference docref = db.collection("users").doc(id);
    docref.update({
      'firstname': firstnameC.text,
      'lastname': lastnameC.text,
      'age': ageC.text
    });
  }

  // Proses Delete

  void deleteUser(String id) {
    DocumentReference docref = db.collection("users").doc(id);
    docref.delete();
  }
}
