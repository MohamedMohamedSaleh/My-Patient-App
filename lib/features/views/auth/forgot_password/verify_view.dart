import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_back.dart';
import '../../../../core/widgets/custom_filled_button.dart';
import '../widgets/custom_resend_code.dart';
import 'reset_password_view.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          if (!didPop) {
            Navigator.pop(context);
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          }
        },
        canPop: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.only(
              top: 50.h,
              left: 24.w,
              right: 24.w,
            ),
            children: [
              const CustomBack(),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Verify Password',
                style: TextStyles.font24Blac700W,
              ),
              SizedBox(
                height: 24.h,
              ),
              PinCodeTextField(
                appContext: context,
                length: 5,
                pinTheme: PinTheme(
                  inactiveBorderWidth: 1.w,
                  borderWidth: 1.w,
                  inactiveColor: const Color(0xff696969),
                  activeColor: mainColor,
                  fieldHeight: 50.h,
                  fieldWidth: 52.w,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
              const CustomResendCode(
                duration: 30,
              ),
              SizedBox(
                height: 212.h,
              ),
              CustomFilledButton(
                  onPressed: () {
                    navigateTo(toPage: const ResetPasswordView());
                  },
                  title: 'Reset'),
            ],
          ),
        ),
      ),
    );
  }
}
