// features/lodin_screen/widgets/LoginPhoto.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lec18/core/main_boton.dart';

class LoginPhoto extends StatefulWidget {
  final void Function(String imagePath) onImageSelected;

  const LoginPhoto({super.key, required this.onImageSelected});

  @override
  State<LoginPhoto> createState() => _LoginPhotoState();
}

class _LoginPhotoState extends State<LoginPhoto> {
  final picker = ImagePicker();

  XFile? photo;

  ImagePicker_camera() async {
    photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      widget.onImageSelected(photo!.path);
    }

    setState(() {});
  }

  ImagePicker_gallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      widget.onImageSelected(photo!.path);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MainBotton(
                        title: "Camera",
                        onTap: () {
                          Navigator.pop(context);
                          ImagePicker_camera();
                        },
                      ),

                      15.verticalSpace,

                      MainBotton(
                        title: "Gallery",
                        onTap: () {
                          Navigator.pop(context);
                          ImagePicker_gallery();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 60,
              backgroundColor: const Color.fromARGB(255, 238, 238, 238),
              backgroundImage: photo != null
                  ? Image.file(File(photo?.path ?? "")).image
                  : null,
              child: photo == null ? Icon(Icons.person, size: 60.r) : null,
            ),
          ),
        ],
      ),
    );
  }
}
