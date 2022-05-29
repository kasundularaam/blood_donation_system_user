part of 'landing_cubit.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingToAuth extends LandingState {}

class LandingToHospital extends LandingState {
  final User user;
  LandingToHospital({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingToHospital && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'LandingToHospital(user: $user)';
}

class LandingToBloodBank extends LandingState {
  final User user;
  LandingToBloodBank({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingToBloodBank && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'LandingToBloodBank(user: $user)';
}

class LandingToLab extends LandingState {
  final User user;
  LandingToLab({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingToLab && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'LandingToLab(user: $user)';
}

class LandingFailed extends LandingState {
  final String errorMsg;
  LandingFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'LandingFailed(errorMsg: $errorMsg)';
}
