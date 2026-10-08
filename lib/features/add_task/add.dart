// features/add_task/add.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lec18/core/Models/task_model.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/core/custom_fild.dart';
import 'package:lec18/core/main_boton.dart';
import 'package:lec18/features/add_task/widgets/status_drob.dart';

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

  var statusController = TextEditingController();

  int selectedIndexColor = 0;

  List<Color> Taskcolor = [
    Colors.brown,
    Colors.blue,
    Colors.black,
    Colors.cyan,
    Colors.amber,
    const Color.fromARGB(255, 125, 124, 121),
    const Color.fromARGB(255, 214, 208, 187),
  ];

  void savetask(TaskModel task) {
    Hive.box<TaskModel>(AppConst.taskbox)
        .add(task)
        .then((v) {
          Navigator.pop(context);
        })
        .catchError((e) {
          print(e.toString());
        });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    statusController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 251),

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

                Form_fild(Controller: titleController, hinttext: "", maxlin: 1),

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
                              ).then((v) {
                                if (v != null) {
                                  dateController.text = DateFormat(
                                    'yyyy-MM-dd',
                                  ).format(v);
                                }
                              });
                            },
                            Controller: dateController,
                            hinttext: "Date",
                            maxlin: 1,
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
                              ).then((v) {
                                if (v != null) {
                                  timeController.text = v.format(context);
                                }
                              });
                            },
                            Controller: timeController,
                            hinttext: "Time",
                            maxlin: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                12.verticalSpace,

                StatusDrob(
                  onchange: (v) {
                    statusController.text = v ?? "";

                    print("Test stutes ${statusController.text}");
                  },
                ),

                20.verticalSpace,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                6.verticalSpace,

                SizedBox(
                  height: 45.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndexColor = index;
                          });
                        },

                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Taskcolor[index],

                          child: index == selectedIndexColor
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                      );
                    },

                    separatorBuilder: (context, index) {
                      return 10.horizontalSpace;
                    },

                    itemCount: Taskcolor.length,
                  ),
                ),

                20.verticalSpace,

                MainBotton(
                  title: "Save Task",
                  onTap: () {
                    savetask(
                      TaskModel(
                        titel: titleController.text,
                        description: descriptionController.text,
                        date: dateController.text,
                        time: timeController.text,
                        status: statusController.text,
                        color: Taskcolor[selectedIndexColor].value,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
