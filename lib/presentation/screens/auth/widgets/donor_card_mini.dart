import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/converters/converters.dart';
import '../../../../../data/models/bds_user.dart';

class DonorCardMini extends StatelessWidget {
  final BdsUser donor;
  const DonorCardMini({
    Key? key,
    required this.donor,
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
                  profileImg(donor.type),
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
                    textD(donor.name, 14),
                    textD(donor.nic, 14),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
