import 'package:basic_flutter_structure/bloc/task_bloc/task_bloc.dart';
import 'package:basic_flutter_structure/data/models/task_model.dart';
import 'package:basic_flutter_structure/presentation/styles/colors.dart';
import 'package:basic_flutter_structure/presentation/widget/bold_text.dart';
import 'package:basic_flutter_structure/presentation/widget/icon_card.dart';
import 'package:basic_flutter_structure/presentation/widget/my_button.dart';
import 'package:basic_flutter_structure/presentation/widget/my_textField.dart';
import 'package:basic_flutter_structure/presentation/widget/regular_text.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class NewTaskScreen extends StatefulWidget {
  NewTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var images = {
    "call_icon.png" : "Call",
    "email_icon.png" : "Email",
    "meeting_icon.png" : "Meeting",
    "personal_icon.png" : "Personal",
    "presentation_icon.png" : "Presentation",
    "another_icon.png" : "Another",
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black87,
              size: 7.w,
            )),
        backgroundColor: AppColor.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          width: 100.w,
          height: 85.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText(
                      text: 'Create New Task',
                      color: Colors.black87,
                      size: 20.sp),
                  Image.asset(
                    'assets/images/another_icon.png',
                    scale: 2.w,
                  ),
                ],
              ),
              MyTextField(
                controller: titleController,
                hintText: 'Task Name',
                lable: "Task Name",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText(text: 'Select Category', color: AppColor.main, size: 12.sp),
                  RegularText(text: 'See all', color: AppColor.main, size: 10.sp),
                ],
              ),
              SizedBox(
                height: 4.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (_context, index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: IconeCard(
                            text: images.values.elementAt(index),
                            textColor: selectedIndex == index ? AppColor.white : AppColor.main,
                            bgColor: selectedIndex == index ? AppColor.main : AppColor.white,
                            borderColor: selectedIndex == index ? AppColor.white : AppColor.main,),
                      );
                    }),
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy/MM/dd',
                controller: dateController,
                firstDate: DateTime.now(),
                lastDate: DateTime(2023),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                locale: Locale('en'),
                onChanged: (val) {
                  dateController.text = val;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DateTimePicker(
                        type: DateTimePickerType.time,
                        timePickerEntryModeInput: true,
                        controller: timeController,
                        icon: Icon(Icons.access_time),
                        timeLabelText: "Start Time",
                        use24HourFormat: true,
                        locale: Locale('en'),
                        onChanged: (val) {
                          timeController.text = val;
                        }),
                  ),
                  Expanded(
                    child: DateTimePicker(
                        type: DateTimePickerType.time,
                        timePickerEntryModeInput: true,
                        controller: timeController,
                        icon: Icon(Icons.access_time),
                        timeLabelText: "End Time",
                        use24HourFormat: false,
                        locale: Locale('en'),
                        onChanged: (val) {
                          timeController.text = val;
                        }),
                  ),
                ],
              ),
              MyTextField(
                controller: descriptionController,
                hintText: 'Description',
                lable: "Description",
              ),
              MyButton(
                title: "Create Task",
                color: AppColor.main,
                onPressed: () {
                  var task = Task(
                    title: titleController.text,
                    icon: images.keys.elementAt(selectedIndex),
                    description: descriptionController.text,
                    time: timeController.text,
                  );
                  context.read<TaskBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
