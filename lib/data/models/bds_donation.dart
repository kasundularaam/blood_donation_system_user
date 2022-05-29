import 'dart:convert';

class BdsDonation {
  final String bloodPackId;
  final int timeStamp;
  final String donorNic;
  final String doctorNic;
  final String place;
  final String completed;
  final String accepted;
  final bool report;
  BdsDonation({
    required this.bloodPackId,
    required this.timeStamp,
    required this.donorNic,
    required this.doctorNic,
    required this.place,
    required this.completed,
    required this.accepted,
    required this.report,
  });

  BdsDonation copyWith({
    String? bloodPackId,
    int? timeStamp,
    String? donorNic,
    String? doctorNic,
    String? place,
    String? completed,
    String? accepted,
    bool? report,
  }) {
    return BdsDonation(
      bloodPackId: bloodPackId ?? this.bloodPackId,
      timeStamp: timeStamp ?? this.timeStamp,
      donorNic: donorNic ?? this.donorNic,
      doctorNic: doctorNic ?? this.doctorNic,
      place: place ?? this.place,
      completed: completed ?? this.completed,
      accepted: accepted ?? this.accepted,
      report: report ?? this.report,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bloodPackId': bloodPackId,
      'timeStamp': timeStamp,
      'donorNic': donorNic,
      'doctorNic': doctorNic,
      'place': place,
      'completed': completed,
      'accepted': accepted,
      'report': report,
    };
  }

  factory BdsDonation.fromMap(Map<String, dynamic> map) {
    return BdsDonation(
      bloodPackId: map['bloodPackId'] ?? '',
      timeStamp: map['timeStamp']?.toInt() ?? 0,
      donorNic: map['donorNic'] ?? '',
      doctorNic: map['doctorNic'] ?? '',
      place: map['place'] ?? '',
      completed: map['completed'] ?? '',
      accepted: map['accepted'] ?? '',
      report: map['report'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsDonation.fromJson(String source) =>
      BdsDonation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsDonation(bloodPackId: $bloodPackId, timeStamp: $timeStamp, donorNic: $donorNic, doctorNic: $doctorNic, place: $place, completed: $completed, accepted: $accepted, report: $report)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsDonation &&
        other.bloodPackId == bloodPackId &&
        other.timeStamp == timeStamp &&
        other.donorNic == donorNic &&
        other.doctorNic == doctorNic &&
        other.place == place &&
        other.completed == completed &&
        other.accepted == accepted &&
        other.report == report;
  }

  @override
  int get hashCode {
    return bloodPackId.hashCode ^
        timeStamp.hashCode ^
        donorNic.hashCode ^
        doctorNic.hashCode ^
        place.hashCode ^
        completed.hashCode ^
        accepted.hashCode ^
        report.hashCode;
  }
}
