import 'package:flexify_client_app/views/home/home_view.dart';
import 'package:flexify_client_app/views/my_appointments/my_appointments_view.dart';
import 'package:flexify_client_app/views/search_consultant/search_consultant_view.dart';
import 'package:flexify_client_app/views/account/account_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  Widget body() {
    switch (currentIndex.value) {
      case 0:
        return HomeView();
      case 1:
        return MyAppointmentsView();
      case 2:
        return SearchConsultantView();
      case 3:
        return AccountView();
      default:
        return const Text("Hata");
    }
  }
}
