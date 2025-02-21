import 'package:cloud_firestore/cloud_firestore.dart';

class BiodataService {
  final FirebaseFirestore db;
  const BiodataService(this.db);

  Future<String> add(Map<String, dynamic> data) async {
    // add data to firestore
    final doc = await db.collection('biodata').add(data);
    return doc.id;
  }

  // get data from firestore
  Stream<QuerySnapshot<Map<String, dynamic>>> getBiodata() {
    return db.collection('biodata').snapshots();
  }

  // update data in firestore
  Future<void> update(String id, Map<String, dynamic> data) async {
    await db.collection('biodata').doc(id).update(data);
  }

  // delete data in firestore
  Future<void> delete(String id) async {
    await db.collection('biodata').doc(id).delete();
  }
}
