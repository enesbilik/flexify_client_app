import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexify_client_app/models/upcoming_appointment.dart';
import 'package:flexify_client_app/utils/time_utils.dart';
import 'package:flexify_client_app/views/appointment_detail/appointment_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/models/consultant.dart';
import 'package:flexify_client_app/services/consultant_service.dart';
import 'package:flexify_client_app/views/consultant_detail/consultant_detail_view.dart';
import 'package:flexify_client_app/views/home/home_controller.dart';
import 'package:flexify_client_app/views/notifications/notifications_view.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flexify_client_app/widgets/custom_search_delegate.dart';
import 'package:flexify_client_app/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.initTopConsultants();
    homeController.initUpcomingAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(
        () => homeController.isLoadingTopConsultants.value ||
                homeController.isLoadingUpcomingAppointments.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: AppPadding().pA15,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        buildSearchField(context),
                        const SizedBox(height: 20),
                        buildSectionTitle("Yaklaşan Randevularım"),
                        const SizedBox(height: 16),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            clipBehavior: Clip.none,
                            autoPlay: true,
                            viewportFraction: 0.99,
                          ),
                          items: List.generate(
                            homeController.upcomingAppointments.length,
                            (index) => buildUpcomingAppointments(
                                homeController.upcomingAppointments[index]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildSectionTitle("Popüler Danışmanlar"),
                        const SizedBox(height: 16),
                        buildPopularConsultantsGrid(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  CustomAppBar buildAppBar() {
    return CustomAppBar(
      centerTitle: false,
      title: 'Merhaba, Hasan',
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Get.to(() => const NotificationsView());
          },
        ),
      ],
    );
  }

  Widget buildSearchField(BuildContext context) {
    return CustomTextField(
      autofocus: false,
      hintText: 'Danışman Ara',
      icon: const Icon(
        Icons.search_outlined,
        color: AppColor.primary,
      ),
      onTap: () async {
        List<Consultant> consultants = [];
        var response = await ConsultantService().getAllConsultants();
        if (response != null && response.statusCode == 200) {
          var data = response.data as Map<String, dynamic>;
          consultants = (data["items"] as List)
              .map((e) => Consultant.fromMap(e))
              .toList();
        }

        //print("consultants: $consultants");

        showSearch(
          context: context,
          delegate: CustomSearchDelegate(consultants),
        );
      },
    );
  }

  Widget buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildUpcomingAppointments(UpcomingAppointment appointment) {
    return GestureDetector(
      onTap: () => Get.to(
        () => AppointmentDetailView(
          appointmentId: appointment.id ?? "",
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 25.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppointmentHeader(appointment),
            const SizedBox(height: 16.0),
            buildAppointmentDateTime(appointment),
          ],
        ),
      ),
    );
  }

  Widget buildAppointmentHeader(UpcomingAppointment appointment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColor.primary.withOpacity(0.5),
          ),
          child: const Icon(
            Icons.person,
            size: 40.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${appointment.consultantName} ${appointment.consultantSurName}",
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              appointment.consultantTitle ?? "",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Spacer(),
        buildAppointmentArrowButton(),
      ],
    );
  }

  Widget buildAppointmentArrowButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: AppColor.primary,
          width: 1.0,
        ),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: AppColor.primary,
      ),
    );
  }

  Widget buildAppointmentDateTime(UpcomingAppointment appointment) {
    var appointmentDateTime = DateTime.parse(appointment.startTime!);
    var appointmentDateTimeEnd = DateTime.parse(appointment.endTime!);

    var formattedStartTime = DateFormat('HH:mm').format(appointmentDateTime);
    var formattedEndTime = DateFormat('HH:mm').format(appointmentDateTimeEnd);

    var timeUtils = TimeUtils();

    var turkishDayName =
        timeUtils.getTurkishDayName(appointmentDateTime.weekday);
    var turkishMonthName =
        timeUtils.getTurkishMonthName(appointmentDateTime.month);

    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tarih ve Saat",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "$turkishDayName, $turkishMonthName ${appointmentDateTime.day}, $formattedStartTime - $formattedEndTime",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPopularConsultantsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 0.85,
      ),
      itemCount: homeController.topConsultants.length,
      itemBuilder: (BuildContext context, int index) {
        return buildConsultantCard(homeController.topConsultants[index]);
      },
    );
  }

  Widget buildConsultantCard(Consultant consultant) {
    return GestureDetector(
      onTap: () => Get.to(() => ConsultantDetailView(
            consultantId: consultant.id!,
          )),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 40.0,
                child: Text(
                  consultant.name?[0] ?? "",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              consultant.name ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              consultant.title ?? "",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            buildRatingBadge(consultant.rating),
          ],
        ),
      ),
    );
  }

  Widget buildRatingBadge(double? rating) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.orange.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow[900]),
          Text(
            rating?.toString() ?? "",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
