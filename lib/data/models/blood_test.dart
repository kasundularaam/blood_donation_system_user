import 'dart:convert';

class BloodTest {
  final String testId;
  final String test;
  final String unit;
  final String min;
  final String max;
  final String result;
  final String status;
  BloodTest({
    required this.testId,
    required this.test,
    required this.unit,
    required this.min,
    required this.max,
    required this.result,
    required this.status,
  });

  BloodTest copyWith({
    String? testId,
    String? test,
    String? unit,
    String? min,
    String? max,
    String? result,
    String? status,
  }) {
    return BloodTest(
      testId: testId ?? this.testId,
      test: test ?? this.test,
      unit: unit ?? this.unit,
      min: min ?? this.min,
      max: max ?? this.max,
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'testId': testId,
      'test': test,
      'unit': unit,
      'min': min,
      'max': max,
      'result': result,
      'status': status,
    };
  }

  factory BloodTest.fromMap(Map<String, dynamic> map) {
    return BloodTest(
      testId: map['testId'] ?? '',
      test: map['test'] ?? '',
      unit: map['unit'] ?? '',
      min: map['min'] ?? '',
      max: map['max'] ?? '',
      result: map['result'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodTest.fromJson(String source) =>
      BloodTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BloodTest(testId: $testId, test: $test, unit: $unit, min: $min, max: $max, result: $result, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BloodTest &&
        other.testId == testId &&
        other.test == test &&
        other.unit == unit &&
        other.min == min &&
        other.max == max &&
        other.result == result &&
        other.status == status;
  }

  @override
  int get hashCode {
    return testId.hashCode ^
        test.hashCode ^
        unit.hashCode ^
        min.hashCode ^
        max.hashCode ^
        result.hashCode ^
        status.hashCode;
  }
}
