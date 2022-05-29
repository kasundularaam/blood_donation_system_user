import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/converters/converters.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../data/models/bds_donation.dart';
import '../../../../../data/models/bds_user.dart';

class DoctorCard extends StatelessWidget {
  final BdsUser doctor;
  final BdsDonation donation;
  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.donation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  profileImg(doctor.type),
                  width: 15.w,
                  height: 15.w,
                  fit: BoxFit.cover,
                ),
              ),
              hSpacer(3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textD(doctor.name, 14),
                    textD(doctor.hospital, 14),
                  ],
                ),
              ),
            ],
          ),
          vSpacer(1),
          const Divider(
            color: AppColors.darkElv1,
          ),
          vSpacer(1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: textD(donation.place, 14)),
              hSpacer(3),
              textD(calculateDate(donation.timeStamp), 14),
            ],
          )
        ]),
      ),
    );
  }
}
