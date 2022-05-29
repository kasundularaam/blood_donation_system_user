import 'dart:convert';

class BdsTest {
  final String id;
  final String test;
  final String unit;
  final String resultType;
  BdsTest({
    required this.id,
    required this.test,
    required this.unit,
    required this.resultType,
  });

  BdsTest copyWith({
    String? id,
    String? test,
    String? unit,
    String? resultType,
  }) {
    return BdsTest(
      id: id ?? this.id,
      test: test ?? this.test,
      unit: unit ?? this.unit,
      resultType: resultType ?? this.resultType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'test': test,
      'unit': unit,
      'resultType': resultType,
    };
  }

  factory BdsTest.fromMap(Map<String, dynamic> map) {
    return BdsTest(
      id: map['id'] ?? '',
      test: map['test'] ?? '',
      unit: map['unit'] ?? '',
      resultType: map['resultType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsTest.fromJson(String source) =>
      BdsTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsTest(id: $id, test: $test, unit: $unit, resultType: $resultType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsTest &&
        other.id == id &&
        other.test == test &&
        other.unit == unit &&
        other.resultType == resultType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ test.hashCode ^ unit.hashCode ^ resultType.hashCode;
  }
}
