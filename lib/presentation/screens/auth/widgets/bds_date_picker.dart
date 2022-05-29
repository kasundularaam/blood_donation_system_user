import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class BdsDatePicker extends StatefulWidget {
  final Function(int) onDateSelected;
  const BdsDatePicker({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<BdsDatePicker> createState() => _BdsDatePickerState();
}

class _BdsDatePickerState extends State<BdsDatePicker> {
  final Color borderColor = AppColors.darkElv0.withOpacity(0.4);
  final Color contentColor = AppColors.darkElv0.withOpacity(0.5);
  String dobText = "Date Of Birth";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100, 1),
        lastDate: DateTime(DateTime.now().year + 1),
      ).then((value) {
        if (value != null) {
          setState(() {
            dobText = "${value.day} - ${value.month} - ${value.year}";
          });
          widget.onDateSelected(value.millisecondsSinceEpoch);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Date not picked!")));
        }
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2.w,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_rounded,
              color: contentColor,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              dobText,
              style: dobText != "Date Of Birth"
                  ? AppTextStyles.p2Dark
                  : AppTextStyles.p2(contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
