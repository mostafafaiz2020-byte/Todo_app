// features/home/widgets/task_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lec18/core/Models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel? taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 175, 165, 165).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 12.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: Color(taskModel!.color),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),

          16.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel?.titel ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff1E293B),
                  ),
                ),

                4.verticalSpace,

                // Task description
                Text(
                  taskModel?.description ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                10.verticalSpace,

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FF),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7.w,
                        height: 7.h,
                        decoration: const BoxDecoration(
                          color: Color(0xff2563EB),
                          shape: BoxShape.circle,
                        ),
                      ),

                      6.horizontalSpace,

                      Text(
                        taskModel?.status ?? "",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(taskModel!.color),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          8.horizontalSpace,

          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.sp,
            color: const Color(0xff94A3B8),
          ),
        ],
      ),
    );
  }
}
