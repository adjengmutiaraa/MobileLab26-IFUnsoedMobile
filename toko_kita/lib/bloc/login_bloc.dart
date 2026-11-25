import 'dart:convert';

import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);

    // API membalas HTTP 200 walau login gagal; cek 'status' di dalam JSON
    if (jsonObj['status'] != true) {
      throw Exception(jsonObj['data'].toString());
    }
    return Login.fromJson(jsonObj);
  }
}
