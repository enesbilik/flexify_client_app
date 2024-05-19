import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPopup extends StatelessWidget {
  final String text;
  final String? lottieUrl;
  const CustomPopup({Key? key, required this.text, this.lottieUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(
              lottieUrl ?? "assets/lotties/order_success.json",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
