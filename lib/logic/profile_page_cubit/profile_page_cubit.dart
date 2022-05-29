import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageInitial());

  Future loadProfile() async {
    try {
      emit(ProfilePageLoading());
      final String nic = await SharedServices.getNic();
      final BdsUser bdsUser = await FireUser.getUserByNic(nic: nic);
      emit(ProfilePageLoaded(bdsUser: bdsUser));
    } catch (e) {
      emit(ProfilePageFailed(errorMsg: e.toString()));
    }
  }
}
