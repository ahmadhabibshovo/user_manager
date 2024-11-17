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

  static Future<int> totalDue() async {
    Query collection = FirebaseFirestore.instance
        .collection('customer')
        .where('customer_due', isGreaterThan: 0);
    QuerySnapshot data = await collection.get();
    int sum = 0;
    for (var item in data.docs) {
      sum += item['customer_due'] as int;
    }
    return sum;
  }

  static update(
      {required Map<String, dynamic> data,
      required String docName,
      required String id}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final documentRef = firestore.collection(docName).doc(id);
    documentRef.update(data);
  }
  static changeMonth()async{
    Query collection = FirebaseFirestore.instance
        .collection('customer');
    QuerySnapshot data = await collection.get();
    for (var user in data.docs) {
     if(user['isActive']){
       update(data: {'customer_due':user['customer_due']+user['customer_bill']}, docName: 'customer', id: user.id);
     }
    }
    
  }
}
