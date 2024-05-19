import 'package:flexify_client_app/cache/cache_manager.dart';
import 'package:flexify_client_app/views/auth/login/login_view.dart';
import 'package:flexify_client_app/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() {
    return Future.delayed(const Duration(milliseconds: 2500), () {
      if (CacheManager().getApiKey().isEmpty) {
        Get.offAll(() => const LoginView());
      } else {
        Get.offAll(() => const MainView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 150,
          child: Lottie.asset("assets/lotties/loading_lottie.json"),
        ),
      ),
    );
  }
}
