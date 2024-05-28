import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
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
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  leading: CircleAvatar(
                    child: Icon(Icons.notifications),
                  ),
                  title: Text(
                    notifications[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    notifications[index].description,
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

  var notifications = [
    NotificationModel(
      title: 'Randevunuz Onaylandı',
      description: 'Zeynep Hanım randevunuzu onayladı.',
    ),
    NotificationModel(
      title: 'Randevunuz İptal Edildi',
      description: 'Samet Bey randevunuz iptal etti.',
    ),
  ];
}

class NotificationModel {
  final String title;
  final String description;

  NotificationModel({required this.title, required this.description});
}
