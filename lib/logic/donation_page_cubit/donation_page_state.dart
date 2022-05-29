part of 'donation_page_cubit.dart';

@immutable
abstract class DonationPageState {}

class DonationPageInitial extends DonationPageState {}

class DonationPageLoading extends DonationPageState {}

class DonationPageLoaded extends DonationPageState {
  final BdsUser doctor;
  final List<BdfQuestion> formQuestions;
  DonationPageLoaded({
    required this.doctor,
    required this.formQuestions,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationPageLoaded &&
        other.doctor == doctor &&
        listEquals(other.formQuestions, formQuestions);
  }

  @override
  int get hashCode => doctor.hashCode ^ formQuestions.hashCode;

  @override
  String toString() =>
      'DonationPageLoaded(doctor: $doctor, formQuestions: $formQuestions)';
}

class DonationPageFailed extends DonationPageState {
  final String errorMsg;
  DonationPageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DonationPageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'DonationPageFailed(errorMsg: $errorMsg)';
}
