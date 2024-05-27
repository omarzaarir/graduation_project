import 'dart:convert';

import 'package:graduation_project/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyUser {
  String email;
  String pass;

  MyUser(this.email, this.pass);

  String tojson() {
    return "{'email': ${this.email},'password': ${this.pass}}";
  }

  Future<String> authintication(Map<String, String> body) async {
    try {
      var client = http.Client();
      var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        // this.token = response.headers['Set-Cookie'];
        // print(response.headers['Set-Cookie']);
        String? rawCookies = response.headers['set-cookie'];
        if (rawCookies != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('cookie', rawCookies);
        }
        return response.body;
      } else {
        return "{'message': 'server error', 'success': false}";
      }
    } catch (e) {
      print(e.toString());
      return "{'message': 'connection error!', 'success': false}";
    }
  }

  Future<String> logout() async {
    if (myUser == null) {
      return "{'message': 'you are already logout!!', 'success': false}";
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? rawCookies = prefs.getString('cookie');

      var client = http.Client();
      var response = await client
          .post(Uri.parse('http://127.0.0.1:5000/logout'), headers: {
        'Content-Type': 'application/json',
        'Cookie': rawCookies!,
      });
      if (response.statusCode == 200) {
        myUser = null;
        return response.body;
      } else {
        // return "{'message': 'logout not success,try later pls!', 'success': false}";
        return response.body;
      }
    } catch (e) {
      print(e.toString());
      return "{'message': 'connection error!', 'success': false}";
    }
  }
}
