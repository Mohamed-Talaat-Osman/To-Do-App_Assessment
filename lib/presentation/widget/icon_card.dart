import 'package:basic_flutter_structure/presentation/widget/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconeCard extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  IconeCard({
    Key? key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      width: 30.w,
      height: 1.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: RegularText(
          text: text,
          color: textColor,
          size: 12.sp,
        ),
      ),
    );
  }
}
