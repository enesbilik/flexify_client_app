import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  final String lottiePath;
  const CustomLottie({Key? key, required this.lottiePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height * 0.27, // 250
      child: Lottie.asset(lottiePath),
    );
  }
}
