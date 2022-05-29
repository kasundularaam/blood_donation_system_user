import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../data/models/bdf_question.dart';

class FormQuestion extends StatelessWidget {
  final BdfQuestion bdfQuestion;
  const FormQuestion({
    Key? key,
    required this.bdfQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          text(bdfQuestion.question, 14, AppColors.darkElv1, bold: true),
          vSpacer(1),
          textD(bdfQuestion.answer.isNotEmpty ? bdfQuestion.answer : "-", 14),
        ],
      ),
    );
  }
}
