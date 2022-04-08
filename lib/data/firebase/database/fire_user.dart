import 'package:blood_donation_system_user/data/models/bds_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireUser {
  static CollectionReference userRef =
      FirebaseFirestore.instance.collection("user");

  static Future<void> addUser({required BdsUser bdsUser}) async {
    try {
      await userRef.doc(bdsUser.nic).set(bdsUser.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> userDocExist({required String nic}) async {
    try {
      bool exist = await userRef.doc(nic).get().then((doc) => doc.exists);
      return exist;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BdsUser> getUser({required String nic}) async {
    try {
      BdsUser bdsUser = await userRef.doc(nic).get().then((doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        return BdsUser.fromMap(map);
      });
      return bdsUser;
    } catch (e) {
      throw e.toString();
    }
  }
}
