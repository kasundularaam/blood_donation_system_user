part of 'profile_page_cubit.dart';

@immutable
abstract class ProfilePageState {}

class ProfilePageInitial extends ProfilePageState {}

class ProfilePageLoading extends ProfilePageState {}

class ProfilePageLoaded extends ProfilePageState {
  final BdsUser bdsUser;
  ProfilePageLoaded({
    required this.bdsUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfilePageLoaded && other.bdsUser == bdsUser;
  }

  @override
  int get hashCode => bdsUser.hashCode;

  @override
  String toString() => 'ProfilePageLoaded(bdsUser: $bdsUser)';
}

class ProfilePageFailed extends ProfilePageState {
  final String errorMsg;
  ProfilePageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfilePageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ProfilePageFailed(errorMsg: $errorMsg)';
}
