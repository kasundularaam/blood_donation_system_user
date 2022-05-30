import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';

part 'auth_nic_state.dart';

class AuthNicCubit extends Cubit<AuthNicState> {
  AuthNicCubit() : super(AuthNicInitial());

  Future getUser({required String nic}) async {
    try {
      emit(AuthNicLoading());
      final bool exist = await FireUser.userExist(nic: nic);
      if (!exist) {
        emit(AuthNicNoAccount(nic: nic));
      }
      if (exist) {
        final BdsUser user = await FireUser.getUserByNic(nic: nic);
        if (user.status) {
          emit(AuthNicActive(user: user));
        } else {
          emit(AuthNicInactive(user: user));
        }
      }
    } catch (e) {
      emit(AuthNicFailed(errorMsg: e.toString()));
    }
  }
}
