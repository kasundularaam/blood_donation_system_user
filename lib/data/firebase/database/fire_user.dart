import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bds_user.dart';

class FireUser {
  static CollectionReference userRef =
      FirebaseFirestore.instance.collection("user");

  static Future addUser({required BdsUser bdsUser}) async {
    try {
      await userRef.doc(bdsUser.nic).set(bdsUser.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> userExist({required String nic}) async {
    try {
      DocumentSnapshot snapshot = await userRef.doc(nic).get();
      return snapshot.exists;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BdsUser> getUserByNic({required String nic}) async {
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

  static Future<BdsUser> getUserByUid({required String uid}) async {
    try {
      QuerySnapshot snapshot = await userRef.where("uid", isEqualTo: uid).get();
      Map<String, dynamic> map =
          snapshot.docs.first.data() as Map<String, dynamic>;
      return BdsUser.fromMap(map);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future setDonationAbility(
      {required String nic, required String donationAbility}) async {
    try {
      await userRef.doc(nic).update({"donationAbility": donationAbility});
    } catch (e) {
      throw e.toString();
    }
  }

  static Future updateStatus({required String nic}) async {
    try {
      await userRef.doc(nic).update({"status": true});
    } catch (e) {
      throw e.toString();
    }
  }

  static Future updateBloodGroup(
      {required String bloodGroup, required String nic}) async {
    try {
      await userRef.doc(nic).update({"bloodGroup": bloodGroup});
    } catch (e) {
      throw e.toString();
    }
  }
}
