import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/components.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../data/models/bds_donation.dart';
import '../../../../data/models/bds_lab.dart';
import '../../../../data/models/blood_test.dart';
import '../../../../logic/donation_page_cubit/donation_page_cubit.dart';
import '../../../../logic/show_report_cubit/show_report_cubit.dart';
import 'widgets/doctor_card.dart';
import 'widgets/donation_form_card.dart';

class DonationPage extends StatefulWidget {
  final BdsDonation donation;
  const DonationPage({
    Key? key,
    required this.donation,
  }) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  BdsDonation get donation => widget.donation;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DonationPageCubit>(context).loadDonation(
        bloodPackId: donation.bloodPackId, doctorNic: donation.doctorNic);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: textL("Donation", 20, bold: true),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6.w),
                ),
                child: Container(
                    width: 100.w,
                    color: AppColors.lightElv1,
                    child: BlocConsumer<DonationPageCubit, DonationPageState>(
                      listener: (context, state) {
                        if (state is DonationPageFailed) {
                          showSnackBar(context, state.errorMsg);
                        }
                        if (state is DonationPageLoaded) {
                          if (donation.accepted != "accepted") {
                            BlocProvider.of<ShowReportCubit>(context)
                                .notAvailable();
                          }
                          if (donation.accepted == "accepted" &&
                              !donation.report) {
                            BlocProvider.of<ShowReportCubit>(context).pending();
                          }
                          if (donation.report) {
                            BlocProvider.of<ShowReportCubit>(context)
                                .loadReport(bloodPackId: donation.bloodPackId);
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is DonationPageLoading) {
                          return Center(child: viewSpinner());
                        }
                        if (state is DonationPageLoaded) {
                          return buildPageLoaded(state, donation);
                        }
                        return Container();
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPageLoaded(DonationPageLoaded state, BdsDonation donation) {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 3.w),
    physics: const BouncingScrollPhysics(),
    children: [
      vSpacer(3),
      donation.completed == "yes"
          ? Card(
              child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: textD("Blood donated successfully", 14,
                              bold: true)),
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 30.sp,
                      )
                    ],
                  )),
            )
          : Card(
              child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: textD(
                          "Blood donated successfully",
                          14,
                          bold: true,
                        ),
                      ),
                      Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                        size: 30.sp,
                      )
                    ],
                  )),
            ),
      vSpacer(2),
      donation.completed == "yes" && donation.accepted == "accepted"
          ? Card(
              child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              textD("Donated blood accepted", 14, bold: true)),
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 30.sp,
                      )
                    ],
                  )),
            )
          : nothing,
      donation.completed == "yes" && donation.accepted == "rejected"
          ? Card(
              child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              textD("Donated blood rejected", 14, bold: true)),
                      Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                        size: 30.sp,
                      )
                    ],
                  )),
            )
          : nothing,
      vSpacer(2),
      textD("Checked by", 14, bold: true),
      vSpacer(1),
      DoctorCard(
        doctor: state.doctor,
        donation: donation,
      ),
      vSpacer(2),
      textD("Donation form", 14, bold: true),
      vSpacer(1),
      DonationFormCard(formQuestions: state.formQuestions),
      vSpacer(2),
      textD("Report", 14, bold: true),
      vSpacer(1),
      BlocBuilder<ShowReportCubit, ShowReportState>(
        builder: (context, state) {
          if (state is ShowReportLoading) {
            return Center(child: viewSpinner());
          }
          if (state is ShowReportPending) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    Expanded(child: textD("Blood report pending", 14)),
                    Icon(
                      Icons.timelapse_rounded,
                      color: Colors.orange,
                      size: 30.sp,
                    )
                  ],
                ),
              ),
            );
          }
          if (state is ShowReportNotAvailable) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    Expanded(child: textD("Blood report not available", 14)),
                    Icon(
                      Icons.block_rounded,
                      color: Colors.red,
                      size: 30.sp,
                    )
                  ],
                ),
              ),
            );
          }
          if (state is ShowReportAvailable) {
            BdsLab lab = state.lab;
            return Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  Strings.labImg,
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
                                    textD(lab.name, 14),
                                    textD(lab.email, 14),
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
                          textP("Address", 12),
                          vSpacer(1),
                          textD(lab.address, 12),
                          vSpacer(2),
                          textP("Contact", 12),
                          vSpacer(1),
                          textD(lab.telephone, 12),
                          vSpacer(3),
                          ListView.builder(
                            itemBuilder: ((context, index) {
                              final BloodTest test = state.bloodTests[index];
                              return Container(
                                width: 100.w,
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: AppColors.lightElv2,
                                      width: 0.2.w,
                                    ),
                                    right: BorderSide(
                                      color: AppColors.lightElv2,
                                      width: 0.2.w,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.lightElv2,
                                      width: 0.2.w,
                                    ),
                                    left: BorderSide(
                                      color: Colors.green,
                                      width: 2.w,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(test.test, 14, AppColors.darkElv1,
                                        bold: true),
                                    vSpacer(1),
                                    textD(test.result, 14),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ]),
                  ),
                ),
              ],
            );
          }
          return nothing;
        },
      ),
      vSpacer(3),
    ],
  );
}
