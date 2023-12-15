import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_by_alam_api/Network_Manager/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      print(body);
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));
      print(response.statusCode);
      print(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}
