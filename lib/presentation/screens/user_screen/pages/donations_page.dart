import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../logic/donations_cubit/donations_cubit.dart';
import '../widgets/donation_card.dart';

class DonationsPage extends StatefulWidget {
  const DonationsPage({Key? key}) : super(key: key);

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DonationsCubit>(context).loadDonations();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            "Donations",
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
            child: BlocConsumer<DonationsCubit, DonationsState>(
              listener: (context, state) {
                if (state is DonationsFailed) {
                  showSnackBar(context, state.errorMsg);
                }
              },
              builder: (context, state) {
                if (state is DonationsLoading) {
                  return Center(child: viewSpinner());
                }
                if (state is DonationsLoaded) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    children: [
                      vSpacer(2),
                      ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.donations.length,
                          itemBuilder: (context, index) {
                            return DonationCard(
                                donation: state.donations[index]);
                          }),
                    ],
                  );
                }
                return const Center(
                  child: Text(
                    "No data available!",
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
