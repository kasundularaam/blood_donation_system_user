import 'dart:convert';

import 'package:flutter/foundation.dart';

class BDSCampaign {
  final String id;
  final String title;
  final int date;
  final double lat;
  final double long;
  final String start;
  final String end;
  final List<String> campaignStaff;
  BDSCampaign({
    required this.id,
    required this.title,
    required this.date,
    required this.lat,
    required this.long,
    required this.start,
    required this.end,
    required this.campaignStaff,
  });

  BDSCampaign copyWith({
    String? id,
    String? title,
    int? date,
    double? lat,
    double? long,
    String? start,
    String? end,
    List<String>? campaignStaff,
  }) {
    return BDSCampaign(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      start: start ?? this.start,
      end: end ?? this.end,
      campaignStaff: campaignStaff ?? this.campaignStaff,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'lat': lat,
      'long': long,
      'start': start,
      'end': end,
      'campaignStaff': campaignStaff,
    };
  }

  factory BDSCampaign.fromMap(Map<String, dynamic> map) {
    return BDSCampaign(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      date: map['date']?.toInt() ?? 0,
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
      start: map['start'] ?? '',
      end: map['end'] ?? '',
      campaignStaff: map['campaignStaff'] != null
          ? List<String>.from(map['campaignStaff'])
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory BDSCampaign.fromJson(String source) =>
      BDSCampaign.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BDSCampaign(id: $id, title: $title, date: $date, lat: $lat, long: $long, start: $start, end: $end, campaignStaff: $campaignStaff)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BDSCampaign &&
        other.id == id &&
        other.title == title &&
        other.date == date &&
        other.lat == lat &&
        other.long == long &&
        other.start == start &&
        other.end == end &&
        listEquals(other.campaignStaff, campaignStaff);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        date.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        start.hashCode ^
        end.hashCode ^
        campaignStaff.hashCode;
  }
}
