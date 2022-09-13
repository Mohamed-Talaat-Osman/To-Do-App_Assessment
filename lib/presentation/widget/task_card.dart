import 'package:basic_flutter_structure/presentation/styles/colors.dart';
import 'package:basic_flutter_structure/presentation/widget/bold_text.dart';
import 'package:basic_flutter_structure/presentation/widget/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TaskCard extends StatelessWidget {
  String title;
  String time;
  String description;
  String image;
  TaskCard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            margin: EdgeInsets.symmetric(vertical: 1.h),
            width: 90.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/" + image , scale: 1.w,),
                SizedBox(width: 3.w,),
                SizedBox(
                  width: 50.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: title, color: Colors.black87, size: 16.sp),
                      SizedBox(height: 2.h,),
                      RegularText(text: description, color: AppColor.main, size: 12.sp),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 15,
          child: Container(
            width: 25.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: RegularText(text: time, color: AppColor.white, size: 12.sp,)),
          ),
        )
      ],
    );
  }
}
