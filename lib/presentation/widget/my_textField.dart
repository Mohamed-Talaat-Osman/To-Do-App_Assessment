
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.controller,
    required this.hintText,
    required this.lable,
  });

  //final Function onChange;
  final TextEditingController controller;
  final String hintText;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(lable),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          //vertical: 0.5.h,
          horizontal: 3.w,
        ),
      ),
    );
  }
}
