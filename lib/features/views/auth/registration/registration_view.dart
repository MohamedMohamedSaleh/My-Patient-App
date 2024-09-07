import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/theming/styles.dart';

import 'widgets/custom_doctor.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ZoomIn(
        duration: const Duration(seconds: 1),
        child: Container(
          width: double.infinity,
          color: mainColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 86.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monitoring Health,',
                        style:
                            TextStyles.font36White700W.copyWith(height: 1.6.h),
                      ),
                      Text(
                        'Empowering',
                        style:
                            TextStyles.font36White700W.copyWith(height: 1.6.h),
                      ),
                      Text(
                        'Lives.',
                        style:
                            TextStyles.font36White700W.copyWith(height: 1.6.h),
                      ),
                    ],
                  ),
                ),
                const CustomDoctor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
