import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flexify_client_app/network/network_manager.dart';

class ConsultantService {
  final dio = NetworkManager.instance.dio;

  Future getAllConsultants() async {
    try {
      final response =
          await dio.get('/Consultant/GetList?PageIndex=0&PageSize=1000');

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future getConsultantById(String consultantId) async {
    try {
      final response = await dio.get('/Consultant/GetById/$consultantId');

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }

  Future getTopConsultants() async {
    try {
      final response = await dio
          .post('/Consultant/GetListByDynamic?PageIndex=0&PageSize=6', data: {
        "sort": [
          {"field": "Rating", "dir": "desc"}
        ]
      });

      return response;
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      return e.response;
    }
  }
}
