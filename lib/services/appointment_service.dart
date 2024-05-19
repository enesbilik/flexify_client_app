import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flexify_client_app/network/network_manager.dart';

class AppointmentService {
  final dio = NetworkManager.instance.dio;

  Future getAppointmentAvailability(String consultantId) async {
    try {
      final response =
          await dio.post('/Appointment/GetAppointmentAvailabilityList', data: {
        'consultantId': consultantId,
      });

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future createAppointment(
      String consultantId, String startTime, String endTime) async {
    try {
      final response = await dio.post('/Appointment/Create', data: {
        'consultantId': consultantId,
        'startTime': startTime,
        'endTime': endTime,
      });

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future getUpcomingAppointments() async {
    try {
      final response =
          await dio.get('/Appointment/GetUpcomingAppointmentsList');

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future getAppointmentById(String appointmentId) async {
    try {
      final response = await dio.get('/Appointment/GetById/$appointmentId');

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future deleteAppointmentById(String appointmentId) async {
    try {
      final response = await dio.get('/Appointment/DeleteById/$appointmentId');

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }
}
