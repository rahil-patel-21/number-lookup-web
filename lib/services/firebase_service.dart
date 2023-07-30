// Imports
import 'package:cloud_firestore/cloud_firestore.dart';

dynamic db = FirebaseFirestore.instance;

class FirebaseService {
  static create(Map<String, dynamic> data, String collectionName,
      {String? docId}) async {
    try {
      if (docId != null) {
        await db.collection(collectionName).doc(docId).set(data);
      } else {
        await db.collection(collectionName).set(data);
      }
    } catch (error) {}
  }

  static update(
      Map<String, dynamic> data, String collectionName, String docId) async {
    try {
      await db.collection(collectionName).doc(docId).update(data);
    } catch (error) {}
  }
}
