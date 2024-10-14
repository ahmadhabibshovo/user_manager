import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  static Future<List<String>> getValueList({required String docName}) async {
    Query collection = get(documentName: docName);
    QuerySnapshot data = await collection.get();
    List<String> listItem = [];
    for (var item in data.docs) {
      listItem.add(item['name']);
    }
    return listItem;
  }

  static CollectionReference get({required String documentName}) {
    return FirebaseFirestore.instance.collection(documentName);
  }

  static add(
      {required String documentName,
      required Map<String, dynamic> document}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection(documentName);
    await users.add(document).then((DocumentReference doc) {});
  }

  static delete(
    String documentId,
    String documentName,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(documentName)
          .doc(documentId)
          .delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  static update(
      {required Map<String, dynamic> data,
      required String docName,
      required String id}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final documentRef = firestore.collection(docName).doc(id);
    documentRef.update(data);
  }
}
