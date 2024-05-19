import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/utils/time_utils.dart';
import 'package:flexify_client_app/views/my_appointments/my_appointments_controller.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointmentsView extends StatefulWidget {
  const MyAppointmentsView({Key? key});

  @override
  State<MyAppointmentsView> createState() => _MyAppointmentsViewState();
}

class _MyAppointmentsViewState extends State<MyAppointmentsView> {
  final myAppointmentsController = Get.put(MyAppointmentsController());

  @override
  void initState() {
    myAppointmentsController.initUpcomingAppointments();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Randevularım',
        ),
        body: Padding(
          padding: AppPadding().pH10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Randevularım',
                    icon: Icon(Icons.calendar_today),
                  ),
                  Tab(
                    text: 'Geçmiş Randevularım',
                    icon: Icon(Icons.history),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Obx(
                      () => myAppointmentsController
                              .isLoadingUpcomingAppointments.value
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: myAppointmentsController
                                  .upcomingAppointments.length,
                              itemBuilder: (context, index) {
                                final appointment = myAppointmentsController
                                    .upcomingAppointments[index];

                                var formattedStartDate =
                                    appointment.startTime?.split("T")[0];

                                var formattedStartTime = appointment.startTime
                                    ?.split("T")[1]
                                    .substring(0, 5);
                                var formattedEndTime = appointment.endTime
                                    ?.split("T")[1]
                                    .substring(0, 5);

                                return Card(
                                  child: ListTile(
                                    title: Text(
                                        "${appointment.consultantName} ${appointment.consultantSurName}"),
                                    subtitle: Text(formattedStartTime! +
                                        " - " +
                                        formattedEndTime! +
                                        " (${formattedStartDate})"),
                                    trailing: Text("Beklemede"),
                                  ),
                                );
                              },
                            ),
                    ),
                    if (pastAppointments.isEmpty)
                      Center(
                        child: Text("Geçmiş randevunuz bulunmamaktadır."),
                      )
                    else
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: pastAppointments.length,
                        itemBuilder: (context, index) {
                          final pastAppointment = pastAppointments[index];
                          return AppointmentComponent(
                              appointment: pastAppointment);
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentComponent extends StatelessWidget {
  final Appointment appointment;

  const AppointmentComponent({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(appointment.name),
        subtitle: Text(appointment.date),
        trailing: Text(appointment.status),
      ),
    );
  }
}

class Appointment {
  final String name;
  final String date;
  final String time;
  final String address;
  final String section;
  final String status;

  const Appointment({
    required this.name,
    required this.date,
    required this.time,
    required this.address,
    required this.section,
    required this.status,
  });
}

List<Appointment> pastAppointments = [
  // Add more past appointments here
];
