import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/firebase/database/fire_donation.dart';
import '../../data/models/bds_donation.dart';
import '../../data/shared/shared_service.dart';

part 'donations_state.dart';

class DonationsCubit extends Cubit<DonationsState> {
  DonationsCubit() : super(DonationsInitial());

  Future loadDonations() async {
    try {
      emit(DonationsLoading());
      final String nic = await SharedServices.getNic();
      List<BdsDonation> donations = await FireDonation.getDonations(nic: nic);
      emit(DonationsLoaded(donations: donations));
    } catch (e) {
      emit(DonationsFailed(errorMsg: e.toString()));
    }
  }
}
