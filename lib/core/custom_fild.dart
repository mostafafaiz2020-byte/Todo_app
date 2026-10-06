// core/custom_fild.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Form_fild extends StatefulWidget {
  final TextEditingController Controller;
  final String hinttext;
  final int maxlin;
  final void Function()? ontap;

  const Form_fild({
    super.key,
    required this.Controller,
    required this.hinttext,
    required this.maxlin,
    this.ontap,
  });

  @override
  State<Form_fild> createState() => _FormFildState();
}

class _FormFildState extends State<Form_fild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.ontap,

      readOnly: widget.ontap != null,

      maxLines: widget.maxlin,

      controller: widget.Controller,

      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },

      cursorColor: Colors.blue,

      decoration: InputDecoration(
        hintText: widget.hinttext,

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
    );
  }
}
