import 'dart:convert';

class BDFField {
  final String id;
  final String question;
  final String type;
  BDFField({
    required this.id,
    required this.question,
    required this.type,
  });

  BDFField copyWith({
    String? id,
    String? question,
    String? type,
  }) {
    return BDFField(
      id: id ?? this.id,
      question: question ?? this.question,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'type': type,
    };
  }

  factory BDFField.fromMap(Map<String, dynamic> map) {
    return BDFField(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BDFField.fromJson(String source) =>
      BDFField.fromMap(json.decode(source));

  @override
  String toString() => 'BDFField(id: $id, question: $question, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BDFField &&
        other.id == id &&
        other.question == question &&
        other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ type.hashCode;
}
