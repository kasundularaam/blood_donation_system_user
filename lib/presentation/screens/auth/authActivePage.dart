import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/bds_user.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../../router/app_router.dart';

class AuthActivePage extends StatefulWidget {
  final BdsUser user;
  const AuthActivePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AuthActivePage> createState() => _AuthActivePageState();
}

class _AuthActivePageState extends State<AuthActivePage> {
  BdsUser get user => widget.user;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  login() {
    BlocProvider.of<LoginCubit>(context).login(
        email: emailCtrl.text, password: passwordCtrl.text, nic: user.nic);
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
          textP("Login", 22, bold: true),
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailed) {
                        showSnackBar(context, state.errorMsg);
                      }
                      if (state is LoginSucceed) {
                        navAndClear(context, AppRouter.landingPage);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return viewSpinner();
                      }
                      return buttonFilledP("Verify", () => login());
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
