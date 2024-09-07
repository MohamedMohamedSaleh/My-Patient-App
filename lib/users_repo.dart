import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patient/users_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.tojson())
        .whenComplete(() => Get.snackbar(
            "success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.green,
            backgroundColor: Colors.white.withOpacity(0.1)))
        .catchError((error, stackTrace) {
      Get.snackbar("problem", "something went wrong. Try again later!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor:
              const Color.fromARGB(255, 255, 193, 193).withOpacity(0.1));
      return error;
    });
  }
}
