import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import 'custom_icon.dart';

class CustomNameIcon extends StatefulWidget {
  const CustomNameIcon({super.key});

  @override
  State<CustomNameIcon> createState() => _CustomNameIconstate();
}

class _CustomNameIconstate extends State<CustomNameIcon> {
  String fullName = "";

  @override
  void initState() {
    super.initState();
    getNameByEmail();
  }

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
        setState(() {
          fullName = querySnapshot.docs.first['name'];
        });
      }
    } catch (error) {
      debugPrint('Error fetching full name: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dr.$fullName',
          style: TextStyles.font16Blac400W.copyWith(fontSize: 14),
        ),
        const CustomIcon()
      ],
    );
  }
}
