import 'package:flexify_client_app/models/appointment_detail.dart';
import 'package:flexify_client_app/services/appointment_service.dart';
import 'package:flexify_client_app/views/main/main_view.dart';
import 'package:get/get.dart';

class AppointmentDetailController extends GetxController {
  var isLoading = true.obs;

  var appointmentDetail = AppointmentDetail().obs;

  void initAppointmentData(String appointmentId) async {
    isLoading(true);
    var response = await AppointmentService().getAppointmentById(appointmentId);
    if (response != null && response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      appointmentDetail.value = AppointmentDetail.fromMap(data);
    }
    isLoading(false);
  }

  void deleteAppointment(String appointmentId) async {
    var response =
        await AppointmentService().deleteAppointmentById(appointmentId);
    if (response != null && response.statusCode == 200) {
      Get.offAll(() => MainView());

      Get.snackbar(
        "Başarılı!",
        "Randevunuz başarıyla silindi.",
      );
    }
  }
}
