import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/auth/fire_auth.dart';
import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  Future createAccount(
      {required BdsUser user, required String password}) async {
    try {
      emit(CreateAccountLoading());
      final User? fireUser =
          await FireAuth.createAccount(email: user.email, password: password);
      final BdsUser newUser = BdsUser(
          nic: user.nic,
          uid: fireUser!.uid,
          type: "user",
          email: user.email,
          img: "",
          name: user.name,
          address: user.address,
          bloodGroup: "",
          dob: user.dob,
          hospital: "",
          status: true,
          mobile: user.mobile,
          gender: "",
          lastTestedDate: 0,
          donationAbility: "");
      await FireUser.addUser(bdsUser: newUser);
      await SharedServices.addUser(nic: user.nic, uid: fireUser.uid);
      emit(CreateAccountSucceed(user: newUser));
    } catch (e) {
      emit(CreateAccountFailed(errorMsg: e.toString()));
    }
  }
}
