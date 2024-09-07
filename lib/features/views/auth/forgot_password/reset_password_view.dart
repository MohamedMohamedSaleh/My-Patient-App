import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';
import 'package:my_patient/features/views/alert_dialog/success_change_password.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context);
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        }
      },
      canPop: false,
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Secure Your New Key',
                style: TextStyles.font24Blac700W,
              ),
              SizedBox(
                height: 24.h,
              ),
              const CustomAppInput(
                labelText: 'New Password',
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomAppInput(
                labelText: 'Confirm Password',
                isPassword: true,
              ),
              SizedBox(
                height: 393.h,
              ),
              CustomFilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SuccessChangePassword();
                    },
                  );
                },
                title: 'Reset',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
