import 'dart:convert';

import 'package:http/http.dart';
import 'package:myhomepage/auth_service.dart';

class EventService {
  final String baseUrl = "http://localhost:3000/";

  String error = '';

  Future getEvents() async {
    final token = await AuthService().getToken();
    Response res = await get(Uri.parse(baseUrl + 'events'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode < 200 || res.body == null) {
      return [];
    } else if (res.statusCode >= 400) {
      final errorObj = jsonDecode(res.body)['message'];

      if (errorObj.runtimeType == List) {
        error = errorObj[0];
      } else {
        error = jsonDecode(res.body)['message'];
      }
      return [];
    }
    return res.body;
  }
}
