import 'package:graduation_project/models/eventclass.dart';
import 'package:http/http.dart' as http;

class FechData {
  static const String _host = "127.0.0.1:5000";
  static const String _home = "home";
  static int _homepage = 1;

  static Future<bool> homeLoding() async {
    try {
      var client = http.Client();
      // var c = Uri.http("127.0.0.1:5000");
      var c = Uri.http(
        _host,
        "/home/g",
      );
      var response = await client.get(
        c,
      );
      dynamic bo = response.body;
      print(activityscc(bo));
      print(response.body);
      return true;
    } catch (e) {
      // print(e.toString());
      return false;
    }
  }
}
