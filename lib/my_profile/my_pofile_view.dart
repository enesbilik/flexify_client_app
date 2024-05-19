import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profilim"),
      body: const Center(
        child: Text("Yakında eklenecek!"),
      ),
    );
  }
}
