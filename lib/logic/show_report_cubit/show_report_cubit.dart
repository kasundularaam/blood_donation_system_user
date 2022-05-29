import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/firebase/database/fire_lab.dart';
import '../../data/firebase/database/fire_report.dart';
import '../../data/models/bds_lab.dart';
import '../../data/models/blood_report.dart';
import '../../data/models/blood_test.dart';

part 'show_report_state.dart';

class ShowReportCubit extends Cubit<ShowReportState> {
  ShowReportCubit() : super(ShowReportInitial());

  Future loadReport({required String bloodPackId}) async {
    try {
      emit(ShowReportLoading());
      final BloodReport report =
          await FireReport.getReport(bloodPackId: bloodPackId);
      final List<BloodTest> bloodTests =
          await FireReport.getBloodTests(bloodPackId: bloodPackId);
      final BdsLab lab = await FireLab.getLab(labId: report.labId);
      emit(ShowReportAvailable(
          report: report, lab: lab, bloodTests: bloodTests));
    } catch (e) {
      emit(ShowReportFailed(errorMsg: e.toString()));
    }
  }

  pending() => emit(ShowReportPending());
  notAvailable() => emit(ShowReportNotAvailable());
}
