part of 'create_account_cubit.dart';

@immutable
abstract class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSucceed extends CreateAccountState {
  final BdsUser user;
  CreateAccountSucceed({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAccountSucceed && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'CreateAccountSucceed(user: $user)';
}

class CreateAccountFailed extends CreateAccountState {
  final String errorMsg;
  CreateAccountFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAccountFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'CreateAccountFailed(errorMsg: $errorMsg)';
}
