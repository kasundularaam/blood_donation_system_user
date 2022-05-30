import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/bds_user.dart';
import '../../../logic/create_account_cubit/create_account_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/bds_date_picker.dart';
import 'widgets/gender_selector.dart';

class AuthNewPage extends StatefulWidget {
  final String nic;
  const AuthNewPage({
    Key? key,
    required this.nic,
  }) : super(key: key);

  @override
  State<AuthNewPage> createState() => _AuthAuthNewState();
}

class _AuthAuthNewState extends State<AuthNewPage> {
  String get nic => widget.nic;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  int dob = 0;
  String gender = "";

  next() {
    final BdsUser user = BdsUser(
        nic: nic,
        uid: "",
        type: "user",
        email: emailCtrl.text,
        img: "",
        name: nameCtrl.text,
        address: addressCtrl.text,
        bloodGroup: "",
        dob: dob,
        hospital: "",
        status: true,
        mobile: mobileCtrl.text,
        gender: "",
        lastTestedDate: 0,
        donationAbility: "");
    BlocProvider.of<CreateAccountCubit>(context)
        .createAccount(user: user, password: passwordCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv1,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            physics: const BouncingScrollPhysics(),
            children: [
              vSpacer(5),
              textP("Create new account", 18, bold: true),
              vSpacer(2),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    children: [
                      textD("NIC", 14, bold: true),
                      hSpacer(3),
                      textD(nic, 14),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textD("Name", 14),
                      vSpacer(1),
                      inputName(nameCtrl),
                      vSpacer(3),
                      textD("Address", 14),
                      vSpacer(1),
                      inputText(addressCtrl),
                      vSpacer(3),
                      textD("Email", 14),
                      vSpacer(1),
                      inputEmail(emailCtrl),
                      vSpacer(3),
                      textD("Phone", 14),
                      vSpacer(1),
                      inputPhone(mobileCtrl),
                      vSpacer(3),
                      textD("Date of birth", 14),
                      vSpacer(1),
                      BdsDatePicker(onDateSelected: (date) => dob = date),
                      vSpacer(3),
                      textD("Gender", 14),
                      vSpacer(1),
                      GenderSelector(onSelect: (value) => gender = value),
                      vSpacer(3),
                      textD("Password", 14),
                      vSpacer(1),
                      inputPassword(passwordCtrl),
                    ],
                  ),
                ),
              ),
              vSpacer(2),
              Center(
                  child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
                listener: (context, state) {
                  if (state is CreateAccountFailed) {
                    showSnackBar(context, state.errorMsg);
                  }
                  if (state is CreateAccountSucceed) {
                    navPush(context, AppRouter.authBloodType, args: state.user);
                  }
                },
                builder: (context, state) {
                  if (state is CreateAccountLoading) {
                    return viewSpinner();
                  }
                  return buttonFilledP("Next", () => next());
                },
              )),
              vSpacer(2),
            ],
          ),
        ),
      ),
    );
  }
}
