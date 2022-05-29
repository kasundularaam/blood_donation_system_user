import 'dart:convert';

class BloodTest {
  final String testId;
  final String test;
  final String unit;
  final String min;
  final String max;
  final String result;
  BloodTest({
    required this.testId,
    required this.test,
    required this.unit,
    required this.min,
    required this.max,
    required this.result,
  });

  BloodTest copyWith({
    String? testId,
    String? test,
    String? unit,
    String? min,
    String? max,
    String? result,
  }) {
    return BloodTest(
      testId: testId ?? this.testId,
      test: test ?? this.test,
      unit: unit ?? this.unit,
      min: min ?? this.min,
      max: max ?? this.max,
      result: result ?? this.result,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodTest.fromJson(String source) =>
      BloodTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BloodTest(testId: $testId, test: $test, unit: $unit, min: $min, max: $max, result: $result)';
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
        other.result == result;
  }

  @override
  int get hashCode {
    return testId.hashCode ^
        test.hashCode ^
        unit.hashCode ^
        min.hashCode ^
        max.hashCode ^
        result.hashCode;
  }
}
