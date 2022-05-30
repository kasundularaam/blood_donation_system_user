import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/auth/fire_auth.dart';
import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login(
      {required String email,
      required String password,
      required String nic}) async {
    try {
      emit(LoginLoading());
      final BdsUser user = await FireUser.getUserByNic(nic: nic);
      if (user.email == email) {
        final User fireUser =
            await FireAuth.signInUser(email: email, password: password);
        await SharedServices.addUser(nic: user.nic, uid: fireUser.uid);
        emit(LoginSucceed());
      }
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
