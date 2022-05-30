import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/constants/strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/bds_user.dart';
import '../../../logic/auth_nic_cubit/auth_nic_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/donor_card_mini.dart';

class AuthNicPage extends StatefulWidget {
  const AuthNicPage({Key? key}) : super(key: key);

  @override
  State<AuthNicPage> createState() => _AuthNicPageState();
}

class _AuthNicPageState extends State<AuthNicPage> {
  TextEditingController nicController = TextEditingController();
  String? get validationErrors {
    if (nicController.text.isEmpty) {
      return 'Please enter your NIC Number!';
    }
    if (!RegExp(r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$')
        .hasMatch(nicController.text)) {
      return 'Invalid NIC Number!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv1,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv1,
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: textP("BLOOD DONATION", 16, bold: true),
              ),
              Image.asset(
                Strings.landingImg,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: inputText(nicController, label: "NIC"),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: BlocBuilder<AuthNicCubit, AuthNicState>(
                  builder: (context, state) {
                    if (state is AuthNicLoading) {
                      return viewSpinner();
                    }
                    return buttonFilledP(
                      "Ok",
                      () => BlocProvider.of<AuthNicCubit>(context)
                          .getUser(nic: nicController.text),
                    );
                  },
                ),
              ),
              vSpacer(3),
              BlocBuilder<AuthNicCubit, AuthNicState>(
                builder: (context, state) {
                  if (state is AuthNicActive) {
                    return buildHasUser(state.user, true);
                  }
                  if (state is AuthNicNoAccount) {
                    return buildNoUser(state.nic);
                  }
                  if (state is AuthNicInactive) {
                    return buildHasUser(state.user, false);
                  }
                  return nothing;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHasUser(BdsUser user, bool active) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textD("Available user", 14, bold: true),
        vSpacer(1),
        DonorCardMini(
          donor: user,
        ),
        vSpacer(1),
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: textD(
                      active ? "Log in to your account" : "Verify your account",
                      14),
                ),
                buttonFilledP(
                  active ? "Login" : "Verify",
                  () => active
                      ? navPush(context, AppRouter.authActivePage, args: user)
                      : navPush(context, AppRouter.authInactivePage,
                          args: user),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNoUser(String userNic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textD("Account not found", 14, bold: true),
        vSpacer(1),
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: textD("Create new account for this NIC", 14),
                ),
                buttonFilledP(
                  "Create",
                  () => navPush(context, AppRouter.authNewPage, args: userNic),
                ),
              ],
            ),
          ),
        ),
        vSpacer(3),
      ],
    );
  }
}
