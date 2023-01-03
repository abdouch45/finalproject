import 'dart:convert';

import 'package:dam_p/local_storage.dart';

import '/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {


  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/login');

    http.Response response = await http.post(
      url,
      headers: header1,
      body: body,
    );
    print("me");
    return response;
  }
  static Future<http.Response> logout() async {

    String? token = await tokenStorage.getToken();

    print('Token : ${token}');


    var url = Uri.parse(baseURL+'/logout');

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'},

    );
    print(response.body);
    return response;
  }

}
class Viva {


  static Future<http.Response> create(Map data) async {

    String? token = await tokenStorage.getToken();



    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/newviva');

    http.Response response = await http.post(
      url,
       headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'},
      body: body,
    );
    return response;
  }
  static Future<http.Response> getViva(String code) async {
    Map data = {
      "code": code,

    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/viva');

    http.Response response = await http.post(
      url,
      headers: header1,
      body: body,
    );
    print("me2");
    return response;
  }
}