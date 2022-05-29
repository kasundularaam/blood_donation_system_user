import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../data/models/bdf_question.dart';
import 'form_question.dart';

class DonationFormCard extends StatelessWidget {
  final List<BdfQuestion> formQuestions;
  const DonationFormCard({
    Key? key,
    required this.formQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FormQuestion(bdfQuestion: formQuestions[0]),
          vSpacer(2),
          FormQuestion(bdfQuestion: formQuestions[1]),
          Row(
            children: [
              Expanded(
                child: text("${formQuestions.length - 2} more fields...", 14,
                    Colors.blue),
              ),
              buttonTextP(
                "See all",
                () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5.w),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  builder: (sheetContext) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      vSpacer(2),
                      Container(
                        width: 10.w,
                        height: 0.7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          color: AppColors.lightElv2,
                        ),
                      ),
                      vSpacer(2),
                      textD("Donation form", 14, bold: true),
                      vSpacer(2),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: formQuestions
                            .map(
                              (question) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Column(
                                  children: [
                                    FormQuestion(bdfQuestion: question),
                                    vSpacer(1),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
