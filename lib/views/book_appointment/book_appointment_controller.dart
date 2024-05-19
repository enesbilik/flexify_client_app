import 'package:flexify_client_app/models/appointment_availability.dart';
import 'package:flexify_client_app/services/appointment_service.dart';
import 'package:flexify_client_app/views/main/main_view.dart';
import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  var isLoading = true.obs;
  var selectedDay = 0.obs;
  var selectedHour = 0.obs;
  List<AvailabilityData> availabilityData = <AvailabilityData>[].obs;

  void selectDay(int day) {
    selectedDay.value = day;
  }

  void selectHour(int hour) {
    selectedHour.value = hour;
  }

  void initAvailabilityData(String consultantId) async {
    isLoading(true);
    var response =
        await AppointmentService().getAppointmentAvailability(consultantId);

    if (response != null && response.statusCode == 200) {
      var newData = (response.data as List)
          .map((e) => AvailabilityData.fromJson(e))
          .toList();
      availabilityData.addAll(newData);
    }
    isLoading(false);
  }

  void bookAppointment(String consultantId) async {
    var selectedAvailability = availabilityData[selectedDay.value];
    var day = selectedAvailability.day;

    var startTime =
        selectedAvailability.timeSlots?[selectedHour.value].startTime;
    var endTime = selectedAvailability.timeSlots?[selectedHour.value].endTime;

    var isoStartTime = "${day}T${startTime!}";
    var isoEndTime = "${day}T${endTime!}";

    var response = await AppointmentService().createAppointment(
      consultantId,
      isoStartTime,
      isoEndTime,
    );

    if (response != null && response.statusCode == 201) {
      Get.snackbar(
          "Randevunuz oluşturuldu.", "Randevunuz başarıyla oluşturuldu.");
      Get.offAll(() => const MainView());
    }
  }
}
