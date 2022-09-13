import 'package:basic_flutter_structure/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddButton extends StatelessWidget {
  AddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
          color: AppColor.main,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          color: AppColor.white,
          size: 3.h,
        ),
      ),
    );
  }
}
