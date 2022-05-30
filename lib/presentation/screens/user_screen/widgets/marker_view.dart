import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../data/models/bds_campaign.dart';

class MarkerView extends StatelessWidget {
  final BDSCampaign campaign;
  const MarkerView({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 1.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Text(
              campaign.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.lightElv0,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Image.asset(
            Strings.dropImg,
            width: 10.w,
            height: 10.w,
          )
        ],
      ),
    );
  }
}
