import 'package:blood_donation_system_user/presentation/screens/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../router/app_router.dart';

class AuthBloodType extends StatefulWidget {
  const AuthBloodType({Key? key}) : super(key: key);

  @override
  State<AuthBloodType> createState() => _AuthBloodTypeState();
}

class _AuthBloodTypeState extends State<AuthBloodType> {
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
      Navigator.pushNamed(
        context,
        AppRouter.homeScreen,
      );
    }
    if (bloodType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select your blood type!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22.sp,
                color: AppColors.lightElv0,
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
                  Text(
                    "Create Account",
                    style: AppTextStyles.h1Light,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Please Pick your Blood type",
                    style: AppTextStyles.p1Light,
                  ),
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
                            ? AppColors.lightElv0
                            : AppColors.lightElv0.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Center(
                        child: Text(
                          bloodTypes[index],
                          style: bloodType == bloodTypes[index]
                              ? AppTextStyles.h2Primary
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
              child: AuthButton(
                text: "Finish",
                onTap: () => finish(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
