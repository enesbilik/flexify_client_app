import 'package:flexify_client_app/models/upcoming_appointment.dart';
import 'package:flexify_client_app/services/appointment_service.dart';
import 'package:get/get.dart';

class MyAppointmentsController extends GetxController {
  List<UpcomingAppointment> upcomingAppointments = <UpcomingAppointment>[].obs;
  var isLoadingUpcomingAppointments = true.obs;

  void initUpcomingAppointments() async {
    isLoadingUpcomingAppointments(true);
    var response = await AppointmentService().getUpcomingAppointments();

    if (response != null && response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      var items = data["items"] as List;
      var newData = (items).map((e) => UpcomingAppointment.fromMap(e)).toList();
      upcomingAppointments.clear();
      upcomingAppointments.addAll(newData);
    }
    isLoadingUpcomingAppointments(false);
  }
}
