import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bds_donation.dart';

class FireDonation {
  static CollectionReference donationRef =
      FirebaseFirestore.instance.collection("donation");

  static Future<void> newDonation({required BdsDonation donation}) async {
    try {
      await donationRef.doc(donation.bloodPackId).set(donation.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> donationExist({required String bloodPackId}) async {
    try {
      DocumentSnapshot snapshot = await donationRef.doc(bloodPackId).get();
      return snapshot.exists;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BdsDonation> getDonation({required String bloodPackId}) async {
    try {
      BdsDonation donation = await donationRef.doc(bloodPackId).get().then(
          (doc) => BdsDonation.fromMap(doc.data() as Map<String, dynamic>));
      return donation;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BdsDonation>> getDonations({required String nic}) async {
    try {
      QuerySnapshot snapshot =
          await donationRef.where("donorNic", isEqualTo: nic).get();
      List<BdsDonation> donations = snapshot.docs
          .map((doc) => BdsDonation.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return donations;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future completeDonation(
      {required String bloodPackId, required String completed}) async {
    try {
      await donationRef.doc(bloodPackId).update({"completed": completed});
    } catch (e) {
      throw e.toString();
    }
  }

  static Future acceptDonation(
      {required String bloodPackId, required String accepted}) async {
    try {
      await donationRef.doc(bloodPackId).update({"accepted": accepted});
    } catch (e) {
      throw e.toString();
    }
  }

  static Future submitReport({required String bloodPackId}) async {
    try {
      await donationRef.doc(bloodPackId).update({"report": true});
    } catch (e) {
      throw e.toString();
    }
  }
}
