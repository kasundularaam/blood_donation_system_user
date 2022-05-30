import 'package:flutter/material.dart';

import '../../data/models/bds_campaign.dart';
import '../../data/models/bds_donation.dart';
import '../constants/strings.dart';
import '../themes/app_colors.dart';

String calculateAge(int timestamp) {
  DateTime dob = DateTime.fromMillisecondsSinceEpoch(timestamp);
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - dob.year;
  return "$age yrs";
}

String calculateDate(int timestamp) {
  if (timestamp == 0) {
    return "";
  }
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
}

bool isCampaignMoreThanTomorrow(BDSCampaign campaign) {
  final DateTime campaignDate =
      DateTime.fromMillisecondsSinceEpoch(campaign.date);
  final int campaignHour = int.parse(campaign.start.split(":")[0]);
  final int campaignMinute = int.parse(campaign.start.split(":")[1]);
  final DateTime campaignDateTime = DateTime(campaignDate.year,
      campaignDate.month, campaignDate.day, campaignHour, campaignMinute);
  bool isMoreThanTomorrow = campaignDateTime.millisecondsSinceEpoch -
          getTomorrow().millisecondsSinceEpoch >
      0;
  return isMoreThanTomorrow;
}

bool isCampaignMoreThanNow(BDSCampaign campaign) {
  final DateTime campaignDate =
      DateTime.fromMillisecondsSinceEpoch(campaign.date);
  final int campaignHour = int.parse(campaign.start.split(":")[0]);
  final int campaignMinute = int.parse(campaign.start.split(":")[1]);
  final DateTime campaignDateTime = DateTime(campaignDate.year,
      campaignDate.month, campaignDate.day, campaignHour, campaignMinute);
  bool isMoreThanTomorrow = campaignDateTime.millisecondsSinceEpoch -
          DateTime.now().millisecondsSinceEpoch >
      0;
  return isMoreThanTomorrow;
}

bool isCampaignToday(BDSCampaign campaign) {
  final DateTime campaignDate =
      DateTime.fromMillisecondsSinceEpoch(campaign.date);
  final int campaignHour = int.parse(campaign.end.split(":")[0]);
  final int campaignMinute = int.parse(campaign.end.split(":")[1]);
  final DateTime campaignDateTime = DateTime(campaignDate.year,
      campaignDate.month, campaignDate.day, campaignHour, campaignMinute);
  bool isMoreThanNow = campaignDateTime.millisecondsSinceEpoch -
          DateTime.now().millisecondsSinceEpoch >
      0;
  bool isLessThanTomorrow = getTomorrow().millisecondsSinceEpoch -
          campaignDateTime.millisecondsSinceEpoch >
      0;

  return isMoreThanNow && isLessThanTomorrow;
}

String daText(String ability) {
  if (ability == "C") {
    return "Can Donate";
  }
  if (ability == "P") {
    return "Permanently Blocked";
  }
  if (ability == "T") {
    return "Temporary Blocked";
  }
  if (ability == "N") {
    return "Not Tested Yet";
  }
  return "Not Tested Yet";
}

IconData daIcon(String ability) {
  if (ability == "C") {
    return Icons.check_circle_outline_rounded;
  }
  if (ability == "P") {
    return Icons.block_rounded;
  }
  if (ability == "T") {
    return Icons.block_outlined;
  }
  if (ability == "N") {
    return Icons.info_outline_rounded;
  }
  return Icons.info_outline_rounded;
}

Color daColor(String ability) {
  if (ability == "C") {
    return Colors.green;
  }
  if (ability == "P") {
    return Colors.red;
  }
  if (ability == "T") {
    return Colors.orange;
  }
  if (ability == "N") {
    return Colors.blue;
  }
  return Colors.blue;
}

String profileImg(String type) {
  if (type == "doctor") {
    return Strings.doctorImg;
  }
  if (type == "nurse") {
    return Strings.nurseImg;
  }
  return Strings.userImg;
}

DateTime getTomorrow() {
  final int tomorrowNow =
      DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch;
  final int tomorrowYear =
      DateTime.fromMillisecondsSinceEpoch(tomorrowNow).year;
  final int tomorrowMonth =
      DateTime.fromMillisecondsSinceEpoch(tomorrowNow).month;
  final int tomorrowDay = DateTime.fromMillisecondsSinceEpoch(tomorrowNow).day;
  final DateTime tomorrow = DateTime(tomorrowYear, tomorrowMonth, tomorrowDay);
  return tomorrow;
}

String donationStatus(BdsDonation donation) {
  if (donation.completed.isEmpty) return "Donation pending...";
  if (donation.completed == "no") return "Donation not completed!";
  if (donation.completed == "yes" && donation.accepted.isEmpty) {
    return "Checking blood samples...";
  }
  if (donation.accepted == "accepted") return "Your donation accepted!";
  if (donation.completed == "rejected") return "Donation donation rejected";
  return "Can't load";
}

Color donationStatusColor(BdsDonation donation) {
  if (donation.completed.isEmpty) return Colors.yellow;
  if (donation.completed == "no") return Colors.red;
  if (donation.completed == "yes" && donation.accepted.isEmpty) {
    return Colors.yellow;
  }
  if (donation.accepted == "accepted") return Colors.green;
  if (donation.completed == "rejected") return Colors.red;
  return AppColors.darkElv1;
}

IconData donationStatusIcon(BdsDonation donation) {
  if (donation.completed.isEmpty) return Icons.timelapse_rounded;
  if (donation.completed == "no") return Icons.block_rounded;
  if (donation.completed == "yes" && donation.accepted.isEmpty) {
    return Icons.timelapse_rounded;
  }
  if (donation.accepted == "accepted") {
    return Icons.check_circle_outline_rounded;
  }
  if (donation.completed == "rejected") return Icons.block_rounded;
  return Icons.warning_rounded;
}
