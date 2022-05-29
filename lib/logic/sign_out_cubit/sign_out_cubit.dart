import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/auth/fire_auth.dart';
import '../../data/shared/shared_service.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  Future signOut() async {
    try {
      emit(SignOutSucceed());
      await FireAuth.signOut();
      await SharedServices.removeUser();
      await SharedServices.removeBankAndLab();
      emit(SignOutSucceed());
    } catch (e) {
      emit(SignOutFailed(errorMsg: e.toString()));
    }
  }
}
