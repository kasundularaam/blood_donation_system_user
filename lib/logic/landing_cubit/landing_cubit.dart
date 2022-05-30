import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future loadApp() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final bool isExist = await SharedServices.isUserIn();
      if (!isExist) {
        emit(LandingToAuth());
      }
      if (isExist) {
        final String nic = await SharedServices.getNic();
        final BdsUser user = await FireUser.getUserByNic(nic: nic);
        emit(LandingToHome(user: user));
      }
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
