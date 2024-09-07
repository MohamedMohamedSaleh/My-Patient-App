import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_back.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';
import '../../../../core/constants/my_colors.dart';

class SendEmailView extends StatelessWidget {
  final _emailController = TextEditingController();
  SendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    Future passwordReset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        if(!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent to your email!'),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        debugPrint(e.toString());
        if(!context.mounted) return;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.toString()),
              );
            });
      }
    }

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
                'Recover Your Access',
                style: TextStyles.font24Blac700W,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomAppInput(labelText: 'Email', controller: _emailController),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: Text(
                  'Back to Login',
                  style: TextStyles.font16Blac400W.copyWith(
                      fontSize: 11.sp,
                      decoration: TextDecoration.underline,
                      color: mainColor),
                ),
              ),
              SizedBox(
                height: 400.h,
              ),
              CustomFilledButton(
                onPressed: () {
                  passwordReset();
                  //navigateTo(toPage: const VerifyView());
                },
                title: 'Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
