import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/themes/app_colors.dart';

class GenderSelector extends StatefulWidget {
  final Function(String) onSelect;
  const GenderSelector({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "";
  onSelect(String gender) => widget.onSelect(gender);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2.w,
          color: AppColors.darkElv0.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              textD("Male", 14),
              Radio<String>(
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                    onSelect(selectedGender);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              textD("Female", 14),
              Radio<String>(
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                    onSelect(selectedGender);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
