import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/bds_test.dart';
import '../../models/blood_report.dart';
import '../../models/blood_test.dart';

class FireReport {
  static CollectionReference reportRef =
      FirebaseFirestore.instance.collection("report");
  static CollectionReference testRef =
      FirebaseFirestore.instance.collection("report");

  static Future<void> newReport({required BloodReport report}) async {
    try {
      await reportRef.doc(report.bloodPackId).set(report.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> reportExist({required String bloodPackId}) async {
    try {
      DocumentSnapshot snapshot = await reportRef.doc(bloodPackId).get();
      return snapshot.exists;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BloodReport> getReport({required String bloodPackId}) async {
    try {
      BloodReport report = await reportRef.doc(bloodPackId).get().then(
          (doc) => BloodReport.fromMap(doc.data() as Map<String, dynamic>));
      return report;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BdsTest>> getLabTests() async {
    try {
      List<BdsTest> tests = await testRef.get().then((snapShot) => snapShot.docs
          .map((doc) => BdsTest.fromMap(doc.data() as Map<String, dynamic>))
          .toList());
      return tests;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future addBloodTests(
      {required List<BloodTest> bloodTests,
      required String bloodPackId}) async {
    try {
      for (BloodTest bloodTest in bloodTests) {
        await reportRef
            .doc(bloodPackId)
            .collection("test")
            .doc(bloodTest.testId)
            .set(bloodTest.toMap());
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BloodTest>> getBloodTests(
      {required String bloodPackId}) async {
    try {
      List<BloodTest> tests = await reportRef
          .doc(bloodPackId)
          .collection("test")
          .get()
          .then((snapShot) => snapShot.docs
              .map((doc) => BloodTest.fromMap(doc.data()))
              .toList());
      return tests;
    } catch (e) {
      throw e.toString();
    }
  }
}
