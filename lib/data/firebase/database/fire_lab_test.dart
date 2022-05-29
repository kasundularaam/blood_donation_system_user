import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bds_test.dart';
import '../../models/blood_test.dart';

class FireLabTest {
  static CollectionReference labTestRef =
      FirebaseFirestore.instance.collection("labTest");

  static CollectionReference bloodTestRef =
      FirebaseFirestore.instance.collection("bloodTest");

  static Future<void> newBloodTest(
      {required BloodTest test, required String bloodPackId}) async {
    try {
      await bloodTestRef
          .doc(bloodPackId)
          .collection("tests")
          .doc(test.testId)
          .set(test.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> bloodtestExist(
      {required String bloodPackId, required String id}) async {
    try {
      DocumentSnapshot snapshot =
          await bloodTestRef.doc(bloodPackId).collection("tests").doc(id).get();
      return snapshot.exists;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BloodTest> getBloodTest(
      {required String bloodPackId, required String id}) async {
    try {
      BloodTest test = await bloodTestRef
          .doc(bloodPackId)
          .collection("tests")
          .doc(id)
          .get()
          .then((doc) => BloodTest.fromMap(doc.data() as Map<String, dynamic>));
      return test;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BloodTest>> getBloodTests(
      {required String bloodPackId}) async {
    try {
      QuerySnapshot snapshot =
          await bloodTestRef.doc(bloodPackId).collection("tests").get();
      List<BloodTest> tests = snapshot.docs
          .map((doc) => BloodTest.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return tests;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BdsTest>> getLabTests() async {
    try {
      QuerySnapshot snapshot = await labTestRef.get();
      List<BdsTest> tests = snapshot.docs
          .map((doc) => BdsTest.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return tests;
    } catch (e) {
      throw e.toString();
    }
  }
}
