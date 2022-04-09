import 'package:blood_donation_system_user/data/models/bds_donation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireDonation {
  static CollectionReference donationRef =
      FirebaseFirestore.instance.collection("donation");
  static Future<List<BdsDonation>> getDonations({required String nic}) async {
    try {
      QuerySnapshot snapshot =
          await donationRef.where("donorNic", isEqualTo: nic).get();
      List<BdsDonation> donations = snapshot.docs
          .map((doc) => BdsDonation.fromMap(doc as Map<String, dynamic>))
          .toList();
      return donations;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BdsDonation> getDonation({required String bloodPacId}) async {
    try {
      BdsDonation donation = await donationRef
          .doc(bloodPacId)
          .get()
          .then((doc) => BdsDonation.fromMap(doc as Map<String, dynamic>));
      return donation;
    } catch (e) {
      throw e.toString();
    }
  }
}
