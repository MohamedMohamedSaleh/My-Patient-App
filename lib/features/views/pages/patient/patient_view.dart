import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/app_image.dart';
import 'package:my_patient/features/views/pages/widgets/custom_name_icon.dart';
import 'package:my_patient/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import '../widgets/custom_data.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewstate();
}

class _PatientViewstate extends State<PatientView> {
  String glucose = "120";
  String heartrate = "70";
  String oxygen = "98";
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
    DatabaseReference rtdb = FirebaseDatabase.instance.ref().child('patient');
    rtdb.onValue.listen(
      (event) {
        setState(() {
          glucose = event.snapshot.child('glucose').value.toString();
          heartrate = event.snapshot.child('heartrate').value.toString();
          oxygen = event.snapshot.child('oxygen').value.toString();
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
                'Patient Condition',
                style: TextStyles.font40Block600W.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomData(
                      data: '$oxygen%',
                      imagePath: 'assets/images/image/oxygen.png',
                      title: 'Oxygen saturation',
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                      child: CustomData(
                    data: '$temperature°C',
                    imagePath: 'assets/images/image/temperature.png',
                    title: 'temperature',
                  )),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              _CustomRowData(
                data: '$heartrate bpm',
                imagePath: 'assets/images/image/heart.png',
                title: 'Heart rate',
              ),
              SizedBox(
                height: 16.h,
              ),
              _CustomRowData(
                data: '$glucose /ml',
                imagePath: 'assets/images/image/glucose.png',
                title: 'Glucose',
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomRowData extends StatelessWidget {
  const _CustomRowData({
    required this.imagePath,
    required this.title,
    required this.data,
  });
  final String imagePath;
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: secondColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF1F3F4).withOpacity(.88),
            blurRadius: 40.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0).w,
        child: Row(
          children: [
            SizedBox(
              width: 65.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AppImage(
                        imagePath,
                        height: 12.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xff696969),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    data,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  color: const Color(0xffEBEBEB),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
