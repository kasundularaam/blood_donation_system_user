import 'package:blood_donation_system_user/data/models/bdf_question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBdfQuestions {
  static CollectionReference questionRef =
      FirebaseFirestore.instance.collection("bloodDonationForm");

  static Future<List<BdfQuestion>> getFormQuestions(
      {required String bloodPacId}) async {
    try {
      List<BdfQuestion> questions = await questionRef
          .doc(bloodPacId)
          .collection("questions")
          .get()
          .then((snapShot) => snapShot.docs
              .map((doc) => BdfQuestion.fromMap(doc as Map<String, dynamic>))
              .toList());
      return questions;
    } catch (e) {
      throw e.toString();
    }
  }
}
