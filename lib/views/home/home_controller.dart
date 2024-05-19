import 'package:flexify_client_app/models/consultant.dart';
import 'package:flexify_client_app/models/upcoming_appointment.dart';
import 'package:flexify_client_app/services/appointment_service.dart';
import 'package:flexify_client_app/services/consultant_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Consultant> topConsultants = <Consultant>[].obs;
  var isLoadingTopConsultants = true.obs;

  List<UpcomingAppointment> upcomingAppointments = <UpcomingAppointment>[].obs;
  var isLoadingUpcomingAppointments = true.obs;

  void initTopConsultants() async {
    isLoadingTopConsultants(true);
    var response = await ConsultantService().getTopConsultants();
    if (response != null && response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      var items = data["items"] as List;
      var newData = (items).map((e) => Consultant.fromMap(e)).toList();
      topConsultants.clear();
      topConsultants.addAll(newData);
    }
    isLoadingTopConsultants(false);
  }

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
