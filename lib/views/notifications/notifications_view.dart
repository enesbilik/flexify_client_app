import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bildirimler',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  leading: CircleAvatar(
                    child: Icon(Icons.notifications),
                  ),
                  title: Text(
                    'Bildirim Başlığı $index',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Bildirim Açıklaması $index',
                  ),
                  onTap: () {},
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
