import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/custom_app_input.dart';
import 'package:my_patient/core/widgets/custom_filled_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAccontView extends StatefulWidget {
  const MyAccontView({super.key});

  @override
  State<MyAccontView> createState() => _MyAccontViewState();
}

class _MyAccontViewState extends State<MyAccontView> {
  @override
  void initState() {
    super.initState();
    getNameByEmail();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String mail = '';

  Future<void> getNameByEmail() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      String? userMail = '';
      userMail = user!.email.toString();
      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Query to find the user document with the matching email
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: userMail).get();

      // Check if a document with the given email exists
      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the full name from the document
        String fullName = querySnapshot.docs.first['name'];
        String email = querySnapshot.docs.first['email'];
        String password = querySnapshot.docs.first['password'];
        nameController.text = fullName;
        emailController.text = email;
        passwordController.text = password;
      }
    } catch (error) {
      debugPrint('Error fetching full name: $error');
    }
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
              'My Profile',
              style: TextStyles.font24Blac700W,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomAppInput(
              controller: nameController,
              labelText: 'Name',
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomAppInput(
              controller: emailController,
              labelText: 'Email',
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomAppInput(
              controller: passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 316.h,
            ),
            CustomFilledButton(
                onPressed: FirebaseAuth.instance.signOut, title: 'Log out!'),
          ],
        ),
      ),
    );
  }
}
