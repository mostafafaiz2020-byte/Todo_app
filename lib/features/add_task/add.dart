// features/add_task/add.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lec18/core/custom_fild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,

        title: Text(
          "Add Task",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Icon(
              Icons.language,
              size: 28.sp,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.all(16.r),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                6.verticalSpace,

                Form_fild(
                  Controller: titleController,
                  hinttext: "Task Title",
                  maxlin: 2,
                ),

                12.verticalSpace,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                6.verticalSpace,

                Form_fild(
                  Controller: descriptionController,
                  hinttext: "Task Description...",
                  maxlin: 5,
                ),

                12.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          6.verticalSpace,

                          Form_fild(
                            ontap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                                initialDate: DateTime.now(),
                              );
                            },
                            Controller: dateController,
                            hinttext: "Date",
                            maxlin: 3,
                          ),
                        ],
                      ),
                    ),

                    10.horizontalSpace,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          6.verticalSpace,

                          Form_fild(
                            ontap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                            },
                            Controller: timeController,
                            hinttext: "Time",
                            maxlin: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                12.verticalSpace,

                ////////////////////////////////////////
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                6.verticalSpace,

                Container(
                  width: double.infinity,
                  height: 60.h,

                  padding: EdgeInsets.symmetric(horizontal: 15.w),

                  decoration: BoxDecoration(
                    color: const Color(0xfff5f1f2),
                    borderRadius: BorderRadius.circular(25.r),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose Status",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 25.sp,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                ),

                15.verticalSpace,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Color",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                10.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                20.verticalSpace,

                SizedBox(
                  width: double.infinity,
                  height: 60.h,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),

                    child: Text(
                      "Save Task",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // مساحة تحت الزر
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
