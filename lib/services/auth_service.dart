import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flexify_client_app/network/network_manager.dart';

class AuthService {
  final dio = NetworkManager.instance.dio;

  Future login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      return response;
    } on DioException catch (e) {
      log(e.response.toString());
      return e.response;
    }
  }

  Future register(String email, String password, String confirmPassword,
      String name, String surName) async {
    try {
      final response = await dio.post('/auth/register', data: {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'userType': 0,
        'clientInfoDto': {
          'name': name,
          'surName': surName,
        },
      });

      return response;
    } on DioException catch (e) {
      log(e.response.toString());
      return e.response;
    }
  }
}
