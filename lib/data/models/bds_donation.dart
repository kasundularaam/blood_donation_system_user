import 'dart:convert';

class BdsDonation {
  final String bloodPacId;
  final int timeStamp;
  final String donorNic;
  final String doctorNic;
  final String placeId;
  final bool completed;
  final String completedNic;
  final bool accepted;
  final bool report;
  BdsDonation({
    required this.bloodPacId,
    required this.timeStamp,
    required this.donorNic,
    required this.doctorNic,
    required this.placeId,
    required this.completed,
    required this.completedNic,
    required this.accepted,
    required this.report,
  });

  BdsDonation copyWith({
    String? bloodPacId,
    int? timeStamp,
    String? donorNic,
    String? doctorNic,
    String? placeId,
    bool? completed,
    String? completedNic,
    bool? accepted,
    bool? report,
  }) {
    return BdsDonation(
      bloodPacId: bloodPacId ?? this.bloodPacId,
      timeStamp: timeStamp ?? this.timeStamp,
      donorNic: donorNic ?? this.donorNic,
      doctorNic: doctorNic ?? this.doctorNic,
      placeId: placeId ?? this.placeId,
      completed: completed ?? this.completed,
      completedNic: completedNic ?? this.completedNic,
      accepted: accepted ?? this.accepted,
      report: report ?? this.report,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bloodPacId': bloodPacId,
      'timeStamp': timeStamp,
      'donorNic': donorNic,
      'doctorNic': doctorNic,
      'placeId': placeId,
      'completed': completed,
      'completedNic': completedNic,
      'accepted': accepted,
      'report': report,
    };
  }

  factory BdsDonation.fromMap(Map<String, dynamic> map) {
    return BdsDonation(
      bloodPacId: map['bloodPacId'] ?? '',
      timeStamp: map['timeStamp']?.toInt() ?? 0,
      donorNic: map['donorNic'] ?? '',
      doctorNic: map['doctorNic'] ?? '',
      placeId: map['placeId'] ?? '',
      completed: map['completed'] ?? false,
      completedNic: map['completedNic'] ?? '',
      accepted: map['accepted'] ?? false,
      report: map['report'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsDonation.fromJson(String source) =>
      BdsDonation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsDonation(bloodPacId: $bloodPacId, timeStamp: $timeStamp, donorNic: $donorNic, doctorNic: $doctorNic, placeId: $placeId, completed: $completed, completedNic: $completedNic, accepted: $accepted, report: $report)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsDonation &&
        other.bloodPacId == bloodPacId &&
        other.timeStamp == timeStamp &&
        other.donorNic == donorNic &&
        other.doctorNic == doctorNic &&
        other.placeId == placeId &&
        other.completed == completed &&
        other.completedNic == completedNic &&
        other.accepted == accepted &&
        other.report == report;
  }

  @override
  int get hashCode {
    return bloodPacId.hashCode ^
        timeStamp.hashCode ^
        donorNic.hashCode ^
        doctorNic.hashCode ^
        placeId.hashCode ^
        completed.hashCode ^
        completedNic.hashCode ^
        accepted.hashCode ^
        report.hashCode;
  }
}
