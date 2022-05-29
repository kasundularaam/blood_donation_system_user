import 'dart:convert';

class BloodReport {
  final String bloodPackId;
  final String labId;
  final int timeStamp;
  final String donationAbility;
  BloodReport({
    required this.bloodPackId,
    required this.labId,
    required this.timeStamp,
    required this.donationAbility,
  });

  BloodReport copyWith({
    String? bloodPackId,
    String? labId,
    int? timeStamp,
    String? donationAbility,
  }) {
    return BloodReport(
      bloodPackId: bloodPackId ?? this.bloodPackId,
      labId: labId ?? this.labId,
      timeStamp: timeStamp ?? this.timeStamp,
      donationAbility: donationAbility ?? this.donationAbility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bloodPackId': bloodPackId,
      'labId': labId,
      'timeStamp': timeStamp,
      'donationAbility': donationAbility,
    };
  }

  factory BloodReport.fromMap(Map<String, dynamic> map) {
    return BloodReport(
      bloodPackId: map['bloodPackId'] ?? '',
      labId: map['labId'] ?? '',
      timeStamp: map['timeStamp']?.toInt() ?? 0,
      donationAbility: map['donationAbility'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodReport.fromJson(String source) =>
      BloodReport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BloodReport(bloodPackId: $bloodPackId, labId: $labId, timeStamp: $timeStamp, donationAbility: $donationAbility)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BloodReport &&
        other.bloodPackId == bloodPackId &&
        other.labId == labId &&
        other.timeStamp == timeStamp &&
        other.donationAbility == donationAbility;
  }

  @override
  int get hashCode {
    return bloodPackId.hashCode ^
        labId.hashCode ^
        timeStamp.hashCode ^
        donationAbility.hashCode;
  }
}
