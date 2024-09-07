import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:my_patient/features/views/auth/register/register_view.dart';
import 'package:my_patient/features/views/auth/registration/widgets/custom_registration_button.dart';

import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../login/login_view.dart';

class CustomDoctor extends StatefulWidget {
  const CustomDoctor({
    super.key,
  });

  @override
  State<CustomDoctor> createState() => _CustomDoctorState();
}

class _CustomDoctorState extends State<CustomDoctor> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mainColor,
                mainColor.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.13, 0.25],
            ),
          ),
          child: AppImage(
            'assets/images/image/doctor.png',
            width: double.infinity,
            height: 567.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 35.h,
          child: Row(
            children: [
              CustomRegistrationButton(
                onTap: () {
                  navigateTo(toPage: LoginView());
                },
                title: 'Sign in',
                isSignIN: true,
              ),
              SizedBox(
                width: 16.w,
              ),
              CustomRegistrationButton(
                onTap: () {
                  navigateTo(toPage: RegisterView());
                },
                isSignIN: false,
                title: 'Sign up',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
