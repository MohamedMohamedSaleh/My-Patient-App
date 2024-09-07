import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/features/views/pages/widgets/custom_name_icon.dart';
import 'package:my_patient/firebase_options.dart';

import '../widgets/custom_data.dart';

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewstate();
}

class _RoomViewstate extends State<RoomView> {
  String humidity = "120";
  String lighting = "98";
  String temperature = "30";
  final Future<FirebaseApp> _fApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _fApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("something wrong in firebase");
        } else if (snapshot.hasData) {
          return content();
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget content() {
    DatabaseReference rtdb = FirebaseDatabase.instance.ref().child('room');
    rtdb.onValue.listen(
      (event) {
        setState(() {
          humidity = event.snapshot.child('humidity').value.toString();
          lighting = event.snapshot.child('lighting').value.toString();
          temperature = event.snapshot.child('temperature').value.toString();
        });
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 62.h,
              ),
              const CustomNameIcon(),
              Text(
                'Ready To Care',
                style: TextStyles.font40Block600W.copyWith(height: 1.3),
              ),
              Text(
                'Today ?',
                style: TextStyles.font40Block600W.copyWith(height: 1.3),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 92.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff0161EF),
                      Color(0xff7FB0F8),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                'Room Condition',
                style: TextStyles.font40Block600W.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomData(
                      data: '$lighting %',
                      imagePath: 'assets/images/image/lighting.png',
                      title: 'Lighting',
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: CustomData(
                      data: '$temperature °C',
                      imagePath: 'assets/images/image/temperature.png',
                      title: 'temperature',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomData(
                      imagePath: 'assets/images/image/humidity.png',
                      title: 'Humidity',
                      data: '$humidity %',
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Expanded(child: SizedBox())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
