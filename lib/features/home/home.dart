// features/home/home.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lec18/core/Models/task_model.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/features/add_task/add.dart';
import 'package:lec18/features/home/widgets/home_appbar.dart';
import 'package:lec18/features/home/widgets/task_item.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> Tasks = Hive.box<TaskModel>(
      AppConst.taskbox,
    ).values.toList();

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      // Add Task Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
          setState(() {});
        },
        backgroundColor: const Color(0xff2563EB),
        elevation: 5,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          "Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            const HomeAppbar(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Tasks
                          _buildStatistic(
                            icon: Icons.checklist_rounded,
                            number: "",
                            title: "Tasks",
                            color: const Color(0xff2563EB),
                          ),

                          _buildDivider(),

                          // Done
                          _buildStatistic(
                            icon: Icons.check_circle_rounded,
                            number: "",
                            title: "Done",
                            color: const Color(0xff22C55E),
                          ),

                          _buildDivider(),

                          // Pending
                          _buildStatistic(
                            icon: Icons.access_time_rounded,
                            number: "",
                            title: "Pending",
                            color: const Color(0xffF59E0B),
                          ),
                        ],
                      ),
                    ),

                    28.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.checklist_rounded,
                              size: 27.sp,
                              color: const Color(0xff1E3A5F),
                            ),

                            10.horizontalSpace,

                            Text(
                              "My Tasks",
                              style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff1E293B),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF2FF),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "All",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff2563EB),
                                ),
                              ),

                              5.horizontalSpace,

                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 20.sp,
                                color: const Color(0xff2563EB),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    16.verticalSpace,

                    Tasks.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),

                            itemBuilder: (context, index) {
                              return TaskItem(taskModel: Tasks[index]);
                            },

                            separatorBuilder: (context, index) {
                              return 14.verticalSpace;
                            },

                            itemCount: Tasks.length,
                          )
                        : LottieBuilder.asset("assets/icons/todo.json"),

                    80.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic({
    required IconData icon,
    required String number,
    required String title,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          height: 42.h,
          width: 42.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 22.sp),
        ),

        8.verticalSpace,

        Text(
          number,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xff1E293B),
          ),
        ),

        2.verticalSpace,

        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xff64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 70.h, width: 1, color: const Color(0xffE2E8F0));
  }
}
