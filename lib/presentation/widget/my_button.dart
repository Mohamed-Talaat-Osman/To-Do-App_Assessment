import 'package:basic_flutter_structure/presentation/styles/colors.dart';
import 'package:basic_flutter_structure/presentation/widget/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  MyButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 7.h,
        width: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color),
        child: BoldText(
          text: title,
          color: AppColor.white,
          size: 16.sp,
        ),
      ),
    );
  }
}