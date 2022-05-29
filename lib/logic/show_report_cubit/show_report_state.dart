part of 'show_report_cubit.dart';

@immutable
abstract class ShowReportState {}

class ShowReportInitial extends ShowReportState {}

class ShowReportLoading extends ShowReportState {}

class ShowReportPending extends ShowReportState {}

class ShowReportNotAvailable extends ShowReportState {}

class ShowReportAvailable extends ShowReportState {
  final BloodReport report;
  final BdsLab lab;
  final List<BloodTest> bloodTests;
  ShowReportAvailable({
    required this.report,
    required this.lab,
    required this.bloodTests,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowReportAvailable &&
        other.report == report &&
        other.lab == lab &&
        listEquals(other.bloodTests, bloodTests);
  }

  @override
  int get hashCode => report.hashCode ^ lab.hashCode ^ bloodTests.hashCode;

  @override
  String toString() =>
      'ShowReportAvailable(report: $report, lab: $lab, bloodTests: $bloodTests)';
}

class ShowReportFailed extends ShowReportState {
  final String errorMsg;
  ShowReportFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowReportFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ShowReportFailed(errorMsg: $errorMsg)';
}
