import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/auth/fire_auth.dart';
import '../../data/shared/shared_service.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future loadApp() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final String type = await SharedServices.getType();
      if (type.isEmpty) {
        emit(LandingToAuth());
      }
      if (type == "user") {
        toHospital();
      }
      if (type == "bloodBank") {
        toBloodBnk();
      }
      if (type == "lab") {
        toLab();
      }
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }

  Future toHospital() async {
    try {
      final User user = FireAuth.user;
      emit(LandingToHospital(user: user));
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }

  Future toBloodBnk() async {
    try {
      final User user = FireAuth.user;
      emit(LandingToBloodBank(user: user));
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }

  Future toLab() async {
    try {
      final User user = FireAuth.user;
      emit(LandingToLab(user: user));
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
