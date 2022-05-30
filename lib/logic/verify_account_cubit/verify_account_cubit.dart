import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/auth/fire_auth.dart';
import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit() : super(VerifyAccountInitial());

  Future verifyAccount(
      {required BdsUser user,
      required String email,
      required String password}) async {
    try {
      emit(VerifyAccountLoading());
      if (user.email == email) {
        final User? fireUser =
            await FireAuth.createAccount(email: email, password: password);
        await FireUser.updateStatus(nic: user.nic);
        await SharedServices.addUser(uid: fireUser!.uid, nic: user.nic);
        emit(VerifyAccountSucceed());
      } else {
        emit(VerifyAccountFailed(errorMsg: "Wrong email address"));
      }
    } catch (e) {
      emit(VerifyAccountFailed(errorMsg: e.toString()));
    }
  }
}
