import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Ayarlar"),
      body: const Center(
        child: Text("Yakında eklenecek!"),
      ),
    );
  }
}
