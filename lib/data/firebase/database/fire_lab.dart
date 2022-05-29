import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bds_lab.dart';

class FireLab {
  static CollectionReference labRef =
      FirebaseFirestore.instance.collection("lab");

  static Future<bool> isLabExist({required String labId}) async {
    try {
      DocumentSnapshot snapshot = await labRef.doc(labId).get();
      return snapshot.exists;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BdsLab> getLab({required String labId}) async {
    try {
      BdsLab bdsLab = await labRef.doc(labId).get().then((doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        return BdsLab.fromMap(map);
      });
      return bdsLab;
    } catch (e) {
      throw e.toString();
    }
  }
}
