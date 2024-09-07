import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_back.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';


class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context);
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
            children: [
              SizedBox(
                height: 40.h,
              ),
              const CustomBack(),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Change Password',
                style: TextStyles.font24Blac700W,
              ),
              SizedBox(
                height: 24.h,
              ),
              const CustomAppInput(
                labelText: 'Old Password',
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomAppInput(
                labelText: 'New Password',
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomAppInput(
                labelText: 'Confirm New Password',
                isPassword: true,
              ),
              SizedBox(
                height: 250.h,
              ),
              CustomFilledButton(onPressed: () {}, title: 'Change Password'),
            ],
          ),
        ),
      ),
    );
  }
}
