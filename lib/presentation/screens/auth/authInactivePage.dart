import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/bds_user.dart';
import '../../../logic/verify_account_cubit/verify_account_cubit.dart';
import '../../router/app_router.dart';

class AuthInactivePage extends StatefulWidget {
  final BdsUser user;
  const AuthInactivePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AuthInactivePage> createState() => _AuthInactivePageState();
}

class _AuthInactivePageState extends State<AuthInactivePage> {
  BdsUser get user => widget.user;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  verify() {
    BlocProvider.of<VerifyAccountCubit>(context).verifyAccount(
      user: user,
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        children: [
          vSpacer(20),
          textP("Verify Account", 22, bold: true),
          vSpacer(10),
          Card(
            color: AppColors.lightElv0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Column(
                children: [
                  inputEmail(emailCtrl, label: "Email"),
                  vSpacer(2),
                  inputPassword(passwordCtrl, label: "Password"),
                  vSpacer(2),
                  BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
                    listener: (context, state) {
                      if (state is VerifyAccountFailed) {
                        showSnackBar(context, state.errorMsg);
                      }
                      if (state is VerifyAccountSucceed) {
                        navAndClear(context, AppRouter.landingPage);
                      }
                    },
                    builder: (context, state) {
                      if (state is VerifyAccountLoading) {
                        return viewSpinner();
                      }
                      return buttonFilledP("Verify", () => verify());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
