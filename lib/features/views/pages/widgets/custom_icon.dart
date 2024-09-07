import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/widgets/app_image.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.height = 30,
    this.width = 30,
    this.color,
    this.onTap,
  });
  final double height;
  final double width;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color ?? const Color(0xff696969).withOpacity(.1),
        ),
        height: 26.h,
        width: 26.w,
        child: Padding(
          padding: const EdgeInsets.all(5.0).w,
          child: const AppImage(
            'assets/images/image/notification.png',
            height: 12,
          ),
        ),
      ),
    );
  }
}
