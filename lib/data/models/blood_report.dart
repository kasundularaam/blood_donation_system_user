import 'dart:convert';

class BloodReport {
  final String bloodPacId;
  final String labId;
  final int timeStamp;
  final String donationAbility;
  BloodReport({
    required this.bloodPacId,
    required this.labId,
    required this.timeStamp,
    required this.donationAbility,
  });

  BloodReport copyWith({
    String? bloodPacId,
    String? labId,
    int? timeStamp,
    String? donationAbility,
  }) {
    return BloodReport(
      bloodPacId: bloodPacId ?? this.bloodPacId,
      labId: labId ?? this.labId,
      timeStamp: timeStamp ?? this.timeStamp,
      donationAbility: donationAbility ?? this.donationAbility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bloodPacId': bloodPacId,
      'labId': labId,
      'timeStamp': timeStamp,
      'donationAbility': donationAbility,
    };
  }

  factory BloodReport.fromMap(Map<String, dynamic> map) {
    return BloodReport(
      bloodPacId: map['bloodPacId'] ?? '',
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
    return 'BloodReport(bloodPacId: $bloodPacId, labId: $labId, timeStamp: $timeStamp, donationAbility: $donationAbility)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BloodReport &&
        other.bloodPacId == bloodPacId &&
        other.labId == labId &&
        other.timeStamp == timeStamp &&
        other.donationAbility == donationAbility;
  }

  @override
  int get hashCode {
    return bloodPacId.hashCode ^
        labId.hashCode ^
        timeStamp.hashCode ^
        donationAbility.hashCode;
  }
}
