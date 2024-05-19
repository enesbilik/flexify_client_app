import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/views/appointment_detail/appointment_detail_controller.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flexify_client_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentDetailView extends StatefulWidget {
  final String appointmentId;
  const AppointmentDetailView({super.key, required this.appointmentId});

  @override
  State<AppointmentDetailView> createState() => _AppointmentDetailViewState();
}

class _AppointmentDetailViewState extends State<AppointmentDetailView> {
  final controller = Get.put(AppointmentDetailController());

  @override
  void initState() {
    controller.initAppointmentData(widget.appointmentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Randevu Detayı',
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _buildBody()),
    );
  }

  Widget _buildBody() {
    var appointmentDateTime =
        DateTime.parse(controller.appointmentDetail.value.startTime ?? "");
    var appointmentDateTimeEnd =
        DateTime.parse(controller.appointmentDetail.value.endTime ?? "");

    var formattedStartTime = DateFormat('HH:mm').format(appointmentDateTime);
    var formattedEndTime = DateFormat('HH:mm').format(appointmentDateTimeEnd);

    var formattedDate = DateFormat('dd.MM.yyyy').format(appointmentDateTime);

    var fullName =
        "${controller.appointmentDetail.value.consultantName} ${controller.appointmentDetail.value.consultantSurName}";

    var location = controller.appointmentDetail.value.consultantLocation ?? "";

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 12.0),
        _buildListTile(Icons.calendar_today, 'Randevu Tarihi', formattedDate),
        const SizedBox(height: 12.0),
        _buildListTile(
            Icons.access_time, 'Başlangıç Saati:', formattedStartTime),
        const SizedBox(height: 12.0),
        _buildListTile(Icons.access_time, 'Bitiş Saati:', formattedEndTime),
        const SizedBox(height: 12.0),
        _buildListTile(Icons.person, 'Danışman:', fullName),
        const SizedBox(height: 12.0),
        _buildListTile(Icons.location_on, 'Lokasyon:', location),
        const SizedBox(height: 12.0),
        _buildListTile(Icons.info, 'Durum:', 'Aktif'),
        const SizedBox(height: 12.0),
        Center(
          child: CustomButton(
            text: 'Randevuyu İptal Et',
            color: AppColor.error,
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Randevu İptali'),
                  content: const Text(
                      'Randevuyu iptal etmek istediğinize emin misiniz?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('İptal'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.deleteAppointment(widget.appointmentId);
                      },
                      child: const Text('Evet'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ListTile _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24.0,
        color: AppColor.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: AppColor.darkPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
