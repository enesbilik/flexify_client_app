import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/views/book_appointment/book_appointment_view.dart';
import 'package:flexify_client_app/views/consultant_detail/consultant_detail_controller.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flexify_client_app/widgets/custom_button.dart';

class ConsultantDetailView extends StatefulWidget {
  final String consultantId;
  const ConsultantDetailView({super.key, required this.consultantId});

  @override
  State<ConsultantDetailView> createState() => _ConsultantDetailViewState();
}

class _ConsultantDetailViewState extends State<ConsultantDetailView> {
  final controller = Get.put(ConsultantDetailController());

  @override
  void initState() {
    controller.initConsultantData(widget.consultantId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Danışman Detayı',
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppPadding().pH15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 40.0,
                                backgroundColor:
                                    AppColor.primary.withOpacity(0.5),
                                child: Text(
                                  controller.consultant.value.name?[0] ?? "",
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.consultant.value.name} ${controller.consultant.value.surName}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  controller.consultant.value.title ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      controller.consultant.value.location ??
                                          "",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: AppPadding().pA10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "+${controller.consultant.value.serviceCount ?? 1} Hizmet",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              _buildVerticalLine(),
                              Text(
                                "+${controller.consultant.value.experience ?? 1} Yıl",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              _buildVerticalLine(),
                              Text(
                                "${controller.consultant.value.rating ?? 3.0} Puan",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Hakkında',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          controller.consultant.value.about ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: CustomButton(
                            text: "Randevu Al",
                            onPressed: () {
                              Get.to(() => BookAppointmentView(
                                  consultantId: widget.consultantId));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildVerticalLine() {
    return Container(
      height: 20,
      width: 1,
      color: Colors.black,
    );
  }
}
