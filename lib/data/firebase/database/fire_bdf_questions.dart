import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bdf_question.dart';
import '../../models/bdf_field.dart';

class FireBdfQuestions {
  static CollectionReference formFieldRef =
      FirebaseFirestore.instance.collection("formField");

  static CollectionReference donationFormRef =
      FirebaseFirestore.instance.collection("donationForm");

  static Future<List<BDFField>> getFormFields() async {
    try {
      List<BDFField> formFields = await formFieldRef.get().then((snapShot) =>
          snapShot.docs
              .map(
                  (doc) => BDFField.fromMap(doc.data() as Map<String, dynamic>))
              .toList());
      return formFields;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future addDonationForm(
      {required List<BdfQuestion> bdfQuestions,
      required String bloodPackId}) async {
    try {
      for (BdfQuestion bdfQuestion in bdfQuestions) {
        await donationFormRef
            .doc(bloodPackId)
            .collection("questions")
            .doc(bdfQuestion.id)
            .set(bdfQuestion.toMap());
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BdfQuestion>> getBDFQuestions(
      {required String bloodPackId}) async {
    try {
      List<BdfQuestion> questions = await donationFormRef
          .doc(bloodPackId)
          .collection("questions")
          .get()
          .then((snapShot) => snapShot.docs
              .map((doc) => BdfQuestion.fromMap(doc.data()))
              .toList());
      return questions;
    } catch (e) {
      throw e.toString();
    }
  }
}
