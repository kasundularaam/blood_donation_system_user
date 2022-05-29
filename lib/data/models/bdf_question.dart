import 'dart:convert';

class BdfQuestion {
  final String id;
  final String question;
  final String answer;
  BdfQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });

  BdfQuestion copyWith({
    String? id,
    String? question,
    String? answer,
  }) {
    return BdfQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory BdfQuestion.fromMap(Map<String, dynamic> map) {
    return BdfQuestion(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BdfQuestion.fromJson(String source) =>
      BdfQuestion.fromMap(json.decode(source));

  @override
  String toString() =>
      'BdfQuestion(id: $id, question: $question, answer: $answer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdfQuestion &&
        other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
