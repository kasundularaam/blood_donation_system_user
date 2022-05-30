import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/database/fire_user.dart';
import '../../data/models/bds_user.dart';
import '../../data/shared/shared_service.dart';

part 'update_blood_type_state.dart';

class UpdateBloodTypeCubit extends Cubit<UpdateBloodTypeState> {
  UpdateBloodTypeCubit() : super(UpdateBloodTypeInitial());

  Future updateBloodType(
      {required String bloodType, required String nic}) async {
    try {
      emit(UpdateBloodTypeLoading());
      await FireUser.updateBloodGroup(bloodGroup: bloodType, nic: nic);
      final BdsUser user = await FireUser.getUserByNic(nic: nic);
      await SharedServices.addUser(nic: user.nic, uid: user.uid);
      emit(UpdateBloodTypeSucceed());
    } catch (e) {
      emit(UpdateBloodTypeFailed(errorMsg: e.toString()));
    }
  }
}
