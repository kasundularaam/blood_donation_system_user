import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../core/converters/converters.dart';
import '../../../../data/models/bds_donation.dart';
import '../../../router/app_router.dart';

class DonationCard extends StatelessWidget {
  final BdsDonation donation;
  const DonationCard({
    Key? key,
    required this.donation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => navPush(context, AppRouter.donationPage, args: donation),
          child: Card(
              child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textD(donation.place, 14, bold: true),
                vSpacer(1),
                Row(
                  children: [
                    Icon(
                      donationStatusIcon(donation),
                      size: 18.sp,
                      color: donationStatusColor(donation),
                    ),
                    hSpacer(2),
                    Expanded(child: textD(donationStatus(donation), 12)),
                    textD(calculateDate(donation.timeStamp), 12)
                  ],
                ),
                vSpacer(2),
                Row(
                  children: [
                    textD("Reports:", 12, bold: true),
                    hSpacer(2),
                    textD(
                        donation.report
                            ? "Available"
                            : donation.accepted == "accepted"
                                ? "Pending"
                                : "Not available",
                        12)
                  ],
                )
              ],
            ),
          )),
        ),
        vSpacer(1),
      ],
    );
  }
}
