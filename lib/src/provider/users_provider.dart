import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_moviles/src/api/environment.dart';
import 'package:proyecto_moviles/src/models/response_api.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_moviles/src/models/user.dart';

class UsersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';
  BuildContext context;

  Future init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams =
          json.encode(user); //recibe todos los parametros de user
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(
          res.body); //data almacena la respuesta (message,error,success)
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

Future<ResponseApi> login(String email, String password) async {

   try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams =
          json.encode({

            'email': email,
            'password': password

          }); //enviamos un mapa de valores
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(
          res.body); //data almacena la respuesta (message,error,success)
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }

}

}
