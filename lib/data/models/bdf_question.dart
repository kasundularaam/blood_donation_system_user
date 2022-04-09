import 'dart:convert';

class BdfQuestion {
  final String questionId;
  final String questionType;
  final String answer;
  BdfQuestion({
    required this.questionId,
    required this.questionType,
    required this.answer,
  });

  BdfQuestion copyWith({
    String? questionId,
    String? questionType,
    String? answer,
  }) {
    return BdfQuestion(
      questionId: questionId ?? this.questionId,
      questionType: questionType ?? this.questionType,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'questionType': questionType,
      'answer': answer,
    };
  }

  factory BdfQuestion.fromMap(Map<String, dynamic> map) {
    return BdfQuestion(
      questionId: map['questionId'] ?? '',
      questionType: map['questionType'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BdfQuestion.fromJson(String source) =>
      BdfQuestion.fromMap(json.decode(source));

  @override
  String toString() =>
      'BdfQuestion(questionId: $questionId, questionType: $questionType, answer: $answer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdfQuestion &&
        other.questionId == questionId &&
        other.questionType == questionType &&
        other.answer == answer;
  }

  @override
  int get hashCode =>
      questionId.hashCode ^ questionType.hashCode ^ answer.hashCode;
}
