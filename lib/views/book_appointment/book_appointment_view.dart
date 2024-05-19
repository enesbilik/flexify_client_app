import 'package:flexify_client_app/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/views/book_appointment/book_appointment_controller.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flexify_client_app/widgets/custom_button.dart';

class BookAppointmentView extends StatefulWidget {
  final String consultantId;
  const BookAppointmentView({super.key, required this.consultantId});

  @override
  _BookAppointmentViewState createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  final BookAppointmentController controller =
      Get.put(BookAppointmentController());

  @override
  void initState() {
    controller.initAvailabilityData(widget.consultantId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Randevu Al',
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: AppPadding().pA15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Gün Seçimi:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: controller.availabilityData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectDay(index);
                              print(
                                  "Selected Day: ${controller.selectedDay.value}");
                            },
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: controller.selectedDay.value == index
                                        ? AppColor.primary
                                        : Colors.transparent,
                                    width: 1.4,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${DateTime.parse(controller.availabilityData[index].day ?? "").day}",
                                        style: TextStyle(
                                          color: controller.selectedDay.value ==
                                                  index
                                              ? AppColor.primary
                                              : Colors.grey[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        TimeUtils().getTurkishDayName(
                                            DateTime.parse(controller
                                                        .availabilityData[index]
                                                        .day ??
                                                    "")
                                                .weekday),
                                        style: TextStyle(
                                          color: controller.selectedDay.value ==
                                                  index
                                              ? AppColor.primary
                                              : Colors.grey[500],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Saat Seçimi:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                        itemCount: getTimeSlotsCount(),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                // Seçili kutudaki durumu kontrol et
                                int status = controller
                                        .availabilityData[
                                            controller.selectedDay.value]
                                        .timeSlots?[index]
                                        .status ??
                                    0;
                                if (status == 0) {
                                  controller.selectHour(index);
                                  print(
                                      "Selected Hour: ${controller.selectedHour.value}");
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: getSlotContainerColor(index),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          controller.selectedHour.value == index
                                              ? AppColor.primary
                                              : Colors.transparent,
                                      width: 1.5),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.availabilityData[controller.selectedDay.value].timeSlots?[index].startTime}-${controller.availabilityData[controller.selectedDay.value].timeSlots?[index].endTime}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: CustomButton(
                        text: "Randevu Al",
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Randevu Al'),
                              content: const Text(
                                  'Randevu almak istediğinize emin misiniz?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('İptal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller
                                        .bookAppointment(widget.consultantId);
                                  },
                                  child: const Text('Evet'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        _buildColorMeaning(Colors.greenAccent[100], "Boş"),
                        _buildColorMeaning(Colors.grey[300], "Bekleniyor"),
                        _buildColorMeaning(Colors.red[300], "Dolu"),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Row _buildColorMeaning(Color? color, String text) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Color? getSlotContainerColor(int index) {
    int status = controller.availabilityData[controller.selectedDay.value]
            .timeSlots?[index].status ??
        0;

    switch (status) {
      case 0: // empty
        return Colors.greenAccent[100];
      case 1: // pending
        return Colors.grey[300];
      case 2: // accepted
        return Colors.red[300];
      case 3: // rejected
        return Colors.grey[200];
      case 4: // completed
        return Colors.grey[200];
      case 5: // canceled
        return Colors.grey[200];
      default:
        return Colors.grey[200]; // Varsayılan renk
    }
  }

  int getTimeSlotsCount() {
    if (controller.availabilityData.isEmpty ||
        controller.selectedDay.value >= controller.availabilityData.length ||
        controller.availabilityData[controller.selectedDay.value].timeSlots ==
            null) {
      return 0;
    } else {
      return controller
          .availabilityData[controller.selectedDay.value].timeSlots!.length;
    }
  }
}
