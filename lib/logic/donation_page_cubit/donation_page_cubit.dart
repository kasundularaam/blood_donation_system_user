import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/firebase/database/fire_bdf_questions.dart';
import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bdf_question.dart';
import '../../data/models/bds_user.dart';

part 'donation_page_state.dart';

class DonationPageCubit extends Cubit<DonationPageState> {
  DonationPageCubit() : super(DonationPageInitial());

  Future loadDonation(
      {required String doctorNic, required String bloodPackId}) async {
    try {
      emit(DonationPageLoading());
      final BdsUser doctor = await FireUser.getUserByNic(nic: doctorNic);
      final List<BdfQuestion> formQuestions =
          await FireBdfQuestions.getBDFQuestions(bloodPackId: bloodPackId);
      emit(DonationPageLoaded(doctor: doctor, formQuestions: formQuestions));
    } catch (e) {
      emit(DonationPageFailed(errorMsg: e.toString()));
    }
  }
}
