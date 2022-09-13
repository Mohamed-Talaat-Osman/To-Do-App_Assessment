import 'package:basic_flutter_structure/bloc/task_bloc/task_bloc.dart';
import 'package:basic_flutter_structure/data/models/task_model.dart';
import 'package:basic_flutter_structure/presentation/styles/colors.dart';
import 'package:basic_flutter_structure/presentation/widget/add_button.dart';
import 'package:basic_flutter_structure/presentation/widget/bold_text.dart';
import 'package:basic_flutter_structure/presentation/widget/image_clipper.dart';
import 'package:basic_flutter_structure/presentation/widget/regular_text.dart';
import 'package:basic_flutter_structure/presentation/widget/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.allTasks;
      return Scaffold(
        backgroundColor: AppColor.main,
        body: Column(
          children: [
            ClipPath(
              clipper: ImageClipper(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                width: double.maxFinite,
                height: 45.h,
                color: AppColor.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.dehaze,
                            size: 8.w,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            size: 8.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BoldText(
                            text: "My Task",
                            color: Colors.black87,
                            size: 20.sp),
                        AddButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/NewTask');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RegularText(
                            text: "Today", color: Colors.black87, size: 18.sp),
                        RegularText(
                            text: "Tuesday, 13 Sep",
                            color: AppColor.main,
                            size: 12.sp),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    SizedBox(
                      height: 7.h,
                      child: HorizontalCalendar(
                        date: DateTime.now(),
                        textColor: Colors.black45,
                        backgroundColor: Colors.white,
                        selectedColor: AppColor.main,
                        onDateSelected: (date) => print(
                          date.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: taskList.isEmpty
                  ? Image.asset('assets/images/notasks.png', scale: 0.6.w,)
                  : ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        var task = taskList[index];
                        return TaskCard(
                          title: task.title,
                          description: task.description,
                          image: task.icon,
                          time: task.time,
                        );
                      }),
            ),
          ],
        ),
      );
    });
  }
}
