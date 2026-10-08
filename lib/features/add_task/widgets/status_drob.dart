// features/add_task/widgets/status_drob.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Status { pending, complate, inprogres }

class StatusDrob extends StatelessWidget {
  const StatusDrob({super.key, required this.onchange});
  final void Function(String?)? onchange;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Status>(
      decoration: InputDecoration(
        hint: Text("Choose Status", style: TextStyle(fontSize: 20.sp)),
        hintStyle: TextStyle(fontSize: 20.sp),

        fillColor: const Color.fromARGB(255, 245, 240, 240),

        filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      items: Status.values.map((e) {
        return DropdownMenuItem(value: e, child: Text(e.name));
      }).toList(),
      onChanged: (v) {
        onchange!(v?.name);
      },
    );
  }
}
