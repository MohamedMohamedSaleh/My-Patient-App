import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/auth.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';
import 'package:my_patient/features/views/auth/login/login_view.dart';
import 'package:my_patient/features/views/auth/login/widgets/custom_divider.dart';

import '../widgets/custom_google_register.dart';
import '../widgets/custom_text_button.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_patient/users_model.dart';
import 'package:my_patient/users_repo.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userRepository = Get.put(UserRepo());

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    final myuser = UserModel(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    await userRepository.createUser(myuser);
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
              'Let’s get to know you!',
              style: TextStyles.font24Blac700W,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomAppInput(
              controller: _nameController,
              labelText: 'Name',
            ),
            SizedBox(
              height: 16.h,
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
              height: 274.h,
            ),
            CustomFilledButton(
              onPressed: signUp,
              title: 'Register',
            ),
            const CustomDivider(),
            SizedBox(
              height: 16.h,
            ),
            CustomGoogleRegister(
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextButton(
              text: 'Have Account?',
              textButton: 'Login',
              onTap: () {
                navigateTo(toPage: LoginView(), replace: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
