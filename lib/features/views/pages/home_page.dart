import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_patient/features/views/pages/my_account/my_accont_view.dart';
import 'package:my_patient/features/views/pages/patient/patient_view.dart';
import 'package:my_patient/features/views/pages/room/room_view.dart';

import '../../../core/widgets/app_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const PatientView(),
    const RoomView(),
    const MyAccontView(),
  ];

  List<String> icons = [
    'patient.png',
    'room.png',
    'account.png',
  ];

  List<String> leble = [
    'Patient',
    'Room',
    'My Account',
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (currentIndex != 0) {
          currentIndex = 0;
          setState(() {});
        } else {
          if (!didPop) {
            Navigator.pop(context);
          }
        }
      },
      canPop: false,
      child: ColoredBox(
        color: Colors.white,
        child: ZoomIn(
          duration: const Duration(milliseconds: 1500),
          child: Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(140, 255, 255, 255),
                  currentIndex: currentIndex,
                  elevation: 10,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  items: List.generate(
                    pages.length,
                    (index) => BottomNavigationBarItem(
                      icon: AppImage(
                        'assets/images/image/${icons[index]}',
                        height: (currentIndex == index) ? 26 : 24,
                        color: (currentIndex == index)
                            ? Colors.white
                            : const Color.fromARGB(140, 255, 255, 255),
                      ),
                      label: leble[index],
                    ),
                  ),
                ),
              ),
            ),
            // there are error when i navigate from tab bar screens
          ),
        ),
      ),
    );
  }
}
