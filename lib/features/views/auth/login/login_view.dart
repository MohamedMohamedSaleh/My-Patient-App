import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_patient/auth.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';
import 'package:my_patient/features/views/auth/forgot_password/send_email_view.dart';
import 'package:my_patient/features/views/auth/login/widgets/custom_divider.dart';
import 'package:my_patient/features/views/auth/register/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_google_register.dart';
import '../widgets/custom_text_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      navigateTo(toPage: const Auth(), replace: true);
    } on FirebaseAuthException catch (_) {
      Fluttertoast.showToast(
          msg: "Wrong Email, or password! \n Try again!",
          gravity: ToastGravity.TOP);
    }
  }

  signinwithgoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleauth = await googleUser?.authentication;
    AuthCredential cred = GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);

    // ignore: unused_local_variable
    UserCredential usercred =
        await FirebaseAuth.instance.signInWithCredential(cred);
    navigateTo(toPage: const Auth(), replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20),
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Hello Again!',
              style: TextStyles.font24Blac700W,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomAppInput(
              controller: _emailController,
              labelText: 'Email',
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomAppInput(
              controller: _passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(toPage: SendEmailView());
              },
              child: Text(
                'Forgot password?',
                style: TextStyles.font16Blac400W.copyWith(
                    fontSize: 11.sp,
                    decoration: TextDecoration.underline,
                    color: mainColor),
              ),
            ),
            SizedBox(
              height: 316.h,
            ),
            CustomFilledButton(onPressed: signIn, title: 'Login'),
            const CustomDivider(),
            SizedBox(
              height: 16.h,
            ),
            CustomGoogleRegister(
              onTap: () {
                signinwithgoogle();
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextButton(
              text: 'New Here?',
              textButton: 'Create Account',
              onTap: () {
                navigateTo(toPage: RegisterView(), replace: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
