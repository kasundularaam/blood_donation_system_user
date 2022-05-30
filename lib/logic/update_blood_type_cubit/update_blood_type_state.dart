part of 'update_blood_type_cubit.dart';

@immutable
abstract class UpdateBloodTypeState {}

class UpdateBloodTypeInitial extends UpdateBloodTypeState {}

class UpdateBloodTypeLoading extends UpdateBloodTypeState {}

class UpdateBloodTypeSucceed extends UpdateBloodTypeState {}

class UpdateBloodTypeFailed extends UpdateBloodTypeState {
  final String errorMsg;
  UpdateBloodTypeFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateBloodTypeFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'UpdateBloodTypeFailed(errorMsg: $errorMsg)';
}
