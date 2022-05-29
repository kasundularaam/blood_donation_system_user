part of 'donations_cubit.dart';

@immutable
abstract class DonationsState {}

class DonationsInitial extends DonationsState {}

class DonationsLoading extends DonationsState {}

class DonationsLoaded extends DonationsState {
  final List<BdsDonation> donations;
  DonationsLoaded({
    required this.donations,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationsLoaded && listEquals(other.donations, donations);
  }

  @override
  int get hashCode => donations.hashCode;

  @override
  String toString() => 'DonationsLoaded(donations: $donations)';
}

class DonationsFailed extends DonationsState {
  final String errorMsg;
  DonationsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'DonationsFailed(errorMsg: $errorMsg)';
}
