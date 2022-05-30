part of 'auth_nic_cubit.dart';

@immutable
abstract class AuthNicState {}

class AuthNicInitial extends AuthNicState {}

class AuthNicLoading extends AuthNicState {}

class AuthNicActive extends AuthNicState {
  final BdsUser user;
  AuthNicActive({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthNicActive && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'AuthNicActive(user: $user)';
}

class AuthNicInactive extends AuthNicState {
  final BdsUser user;
  AuthNicInactive({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthNicInactive && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'AuthNicInactive(user: $user)';
}

class AuthNicNoAccount extends AuthNicState {
  final String nic;
  AuthNicNoAccount({
    required this.nic,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthNicNoAccount && other.nic == nic;
  }

  @override
  int get hashCode => nic.hashCode;

  @override
  String toString() => 'AuthNicNoAccount(nic: $nic)';
}

class AuthNicFailed extends AuthNicState {
  final String errorMsg;
  AuthNicFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthNicFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'AuthNicFailed(errorMsg: $errorMsg)';
}
