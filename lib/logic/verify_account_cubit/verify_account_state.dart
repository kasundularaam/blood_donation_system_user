part of 'verify_account_cubit.dart';

@immutable
abstract class VerifyAccountState {}

class VerifyAccountInitial extends VerifyAccountState {}

class VerifyAccountLoading extends VerifyAccountState {}

class VerifyAccountSucceed extends VerifyAccountState {}

class VerifyAccountFailed extends VerifyAccountState {
  final String errorMsg;
  VerifyAccountFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifyAccountFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'VerifyAccountFailed(errorMsg: $errorMsg)';
}
