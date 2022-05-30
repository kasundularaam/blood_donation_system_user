part of 'donation_map_cubit.dart';

@immutable
abstract class DonationMapState {}

class DonationMapInitial extends DonationMapState {}

class DonationMapLoading extends DonationMapState {}

class DonationMapLoaded extends DonationMapState {
  final List<Marker> markers;
  DonationMapLoaded({
    required this.markers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationMapLoaded && listEquals(other.markers, markers);
  }

  @override
  int get hashCode => markers.hashCode;

  @override
  String toString() => 'DonationMapLoaded(markers: $markers)';
}

class DonationMapFailed extends DonationMapState {
  final String errorMsg;
  DonationMapFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationMapFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'DonationMapFailed(errorMsg: $errorMsg)';
}
