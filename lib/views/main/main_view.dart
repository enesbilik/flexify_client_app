import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/views/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: mainController.body(),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        currentIndex: mainController.currentIndex.value,
        onTap: (index) => mainController.setCurrentIndex(index),
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_rounded,
            ),
            label: "Randevularım",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: "Danışman Bul",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: "Hesabım",
          ),
        ],
      ),
    );
  }
}
