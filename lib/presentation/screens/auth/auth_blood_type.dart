import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../data/models/bds_user.dart';
import '../../../logic/update_blood_type_cubit/update_blood_type_cubit.dart';
import '../../router/app_router.dart';

class AuthBloodType extends StatefulWidget {
  final BdsUser user;
  const AuthBloodType({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AuthBloodType> createState() => _AuthBloodTypeState();
}

class _AuthBloodTypeState extends State<AuthBloodType> {
  BdsUser get user => widget.user;
  static const List<String> bloodTypes = [
    "A",
    "A+",
    "B",
    "B+",
    "O",
    "O+",
    "AB",
    "AB+"
  ];
  String bloodType = "";

  finish() {
    if (bloodType != "") {
      BlocProvider.of<UpdateBloodTypeCubit>(context)
          .updateBloodType(bloodType: bloodType, nic: user.nic);
    }
    if (bloodType.isEmpty) {
      showSnackBar(context, "Please select your blood group");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv0,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22.sp,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textP("Create Account", 18, bold: true),
                  vSpacer(2),
                  textP("Please Pick your Blood type", 14),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 3.w,
              mainAxisSpacing: 3.w,
              childAspectRatio: (1 / .4),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                bloodTypes.length,
                (index) {
                  return InkWell(
                    onTap: () => setState(() {
                      bloodType = bloodTypes[index];
                    }),
                    borderRadius: BorderRadius.circular(2.w),
                    child: Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: bloodType == bloodTypes[index]
                            ? AppColors.primaryColor
                            : AppColors.primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Center(
                        child: Text(
                          bloodTypes[index],
                          style: bloodType == bloodTypes[index]
                              ? AppTextStyles.h2Light
                              : AppTextStyles.h2Light,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: BlocConsumer<UpdateBloodTypeCubit, UpdateBloodTypeState>(
                listener: (context, state) {
                  if (state is UpdateBloodTypeFailed) {
                    showSnackBar(context, state.errorMsg);
                  }
                  if (state is UpdateBloodTypeSucceed) {
                    navAndClear(context, AppRouter.landingPage);
                  }
                },
                builder: (context, state) {
                  if (state is UpdateBloodTypeLoading) {
                    return viewSpinner();
                  }
                  return buttonFilledP(
                    "Finish",
                    () => finish(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
