import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/converters/converters.dart';
import '../../models/bds_campaign.dart';

class FireCampaign {
  static CollectionReference campaignRef =
      FirebaseFirestore.instance.collection("campaign");

  static Future<List<BDSCampaign>> getTodayCampaign(
      {required String nic}) async {
    try {
      QuerySnapshot snapshot =
          await campaignRef.where("campaignStaff", arrayContains: nic).get();
      List<BDSCampaign> campaigns = snapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        return BDSCampaign.fromMap(map);
      }).toList();

      List<BDSCampaign> list = [];
      for (BDSCampaign campaign in campaigns) {
        if (isCampaignToday(campaign)) {
          list.add(campaign);
        }
      }
      return list;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<BDSCampaign>> getUpcomingCampaigns(
      {required String nic}) async {
    try {
      QuerySnapshot snapshot =
          await campaignRef.where("campaignStaff", arrayContains: nic).get();
      List<BDSCampaign> campaigns = snapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        return BDSCampaign.fromMap(map);
      }).toList();
      List<BDSCampaign> list = [];
      for (BDSCampaign campaign in campaigns) {
        if (isCampaignMoreThanTomorrow(campaign)) {
          list.add(campaign);
        }
      }
      return list;
    } catch (e) {
      throw e.toString();
    }
  }
}
