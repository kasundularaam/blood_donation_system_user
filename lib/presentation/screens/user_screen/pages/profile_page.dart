import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/converters/converters.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../data/models/bds_user.dart';
import '../../../../../logic/profile_page_cubit/profile_page_cubit.dart';
import '../../../../../logic/sign_out_cubit/sign_out_cubit.dart';
import '../../../router/app_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfilePageCubit>(context).loadProfile();
    return BlocConsumer<ProfilePageCubit, ProfilePageState>(
      listener: (context, state) {
        if (state is ProfilePageFailed) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is ProfilePageLoading) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Text(
                  "Profile",
                  style: AppTextStyles.h1Light,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightElv1,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.w),
                    ),
                  ),
                  child: Center(
                    child: viewSpinner(),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is ProfilePageLoaded) {
          final BdsUser bdsUser = state.bdsUser;
          final String da = bdsUser.donationAbility;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Text(
                  "Profile",
                  style: AppTextStyles.h1Light,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        profileImg(
                          bdsUser.type,
                        ),
                        width: 25.w,
                        height: 25.w,
                      ),
                    ),
                    hSpacer(3),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textL(bdsUser.name, 18, bold: true),
                          vSpacer(1),
                          Row(
                            children: [
                              Icon(
                                Icons.card_membership_rounded,
                                color: AppColors.lightElv0,
                                size: 14.sp,
                              ),
                              hSpacer(2),
                              textL(bdsUser.nic, 12),
                            ],
                          ),
                          vSpacer(1),
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: AppColors.lightElv0,
                                size: 14.sp,
                              ),
                              hSpacer(2),
                              textL(bdsUser.email, 12),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              vSpacer(2),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightElv1,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.w),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      vSpacer(2),
                      textD("Donation ability", 14, bold: true),
                      vSpacer(1),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              color: AppColors.lightElv0,
                              border: Border.all(
                                color: daColor(bdsUser.donationAbility),
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(3.w)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                daIcon(da),
                                color: daColor(da),
                                size: 20.sp,
                              ),
                              hSpacer(2),
                              text(daText(da), 14, daColor(da), bold: true)
                            ],
                          ),
                        ),
                      ),
                      vSpacer(2),
                      textD("User details", 14, bold: true),
                      vSpacer(1),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.water_drop_rounded,
                                          color: AppColors.primaryColor,
                                          size: 20.sp,
                                        ),
                                        hSpacer(3),
                                        textD(bdsUser.bloodGroup, 14)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          color: AppColors.primaryColor,
                                          size: 20.sp,
                                        ),
                                        hSpacer(3),
                                        textD(calculateAge(bdsUser.dob), 14)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_rounded,
                                          color: AppColors.primaryColor,
                                          size: 20.sp,
                                        ),
                                        hSpacer(3),
                                        textD(bdsUser.gender, 14)
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textP("Address", 12),
                              vSpacer(1),
                              textD(bdsUser.address, 12),
                              vSpacer(2),
                              textP("Hospital", 12),
                              vSpacer(1),
                              textD(bdsUser.hospital, 12),
                              vSpacer(2),
                              textP("DOB", 12),
                              vSpacer(1),
                              textD(calculateDate(bdsUser.dob), 12),
                              vSpacer(2),
                              textP("Last checked date", 12),
                              vSpacer(1),
                              textD(
                                  calculateDate(bdsUser.lastTestedDate).isEmpty
                                      ? "Not checked yet"
                                      : calculateDate(bdsUser.lastTestedDate),
                                  12),
                            ],
                          ),
                        ),
                      ),
                      vSpacer(3),
                      BlocConsumer<SignOutCubit, SignOutState>(
                        listener: (context, state) {
                          if (state is SignOutFailed) {
                            showSnackBar(context, state.errorMsg);
                          }
                          if (state is SignOutSucceed) {
                            navAndClear(context, AppRouter.landingPage);
                          }
                        },
                        builder: (context, state) {
                          return buttonTextP(
                            "Sign Out",
                            () => BlocProvider.of<SignOutCubit>(context)
                                .signOut(),
                          );
                        },
                      ),
                      vSpacer(5),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Text(
                "Profile",
                style: AppTextStyles.h1Light,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightElv1,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(6.w),
                  ),
                ),
                child: Center(
                  child: textD("No data available!", 12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
