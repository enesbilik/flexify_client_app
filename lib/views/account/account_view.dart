import 'package:flexify_client_app/cache/cache_manager.dart';
import 'package:flexify_client_app/my_profile/my_pofile_view.dart';
import 'package:flexify_client_app/views/auth/login/login_view.dart';
import 'package:flexify_client_app/views/notifications/notifications_view.dart';
import 'package:flexify_client_app/views/settings/settings_view.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Hesabım"),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text("Randevularım"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                // Burada randevuların listelendiği sayfaya git
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profilim"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const MyProfileView());
                // Burada profil düzenleme sayfasına git
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Bildirimler"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const NotificationsView());
                // Burada bildirimlerin listelendiği sayfaya git
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const SettingsView());
                // Burada genel ayarlar sayfasına git
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Çıkış Yap"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                CacheManager().setApiKey("");

                Get.off(() => const LoginView());
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
          ],
        ),
      ),
    );
  }
}
