import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../core/components/components.dart';
import '../../../../core/constants/strings.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            "Request",
            style: AppTextStyles.h1Light,
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightElv0,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(6.w),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              physics: const BouncingScrollPhysics(),
              children: [
                vSpacer(3),
                textD("Request blood for me", 14, bold: true),
                vSpacer(2),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      children: [
                        Image.asset(
                          Strings.meImg,
                          width: 45.w,
                          fit: BoxFit.fitWidth,
                        ),
                        Row(
                          children: [
                            Expanded(child: textD("Request Blood For Me", 14)),
                            buttonFilledP("Request", () => {})
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                vSpacer(3),
                textD("Request blood for a Friend", 14, bold: true),
                vSpacer(2),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      children: [
                        Image.asset(
                          Strings.friendImg,
                          width: 45.w,
                          fit: BoxFit.fitWidth,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: textD("Request Blood For a Friend", 14)),
                            buttonFilledP("Request", () => {})
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
