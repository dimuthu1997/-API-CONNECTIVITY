import 'package:loginpage/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class RestAPIService {
  String apiUrl =
      'https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/other%2Fvideo126%2Fusers.json?alt=media';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    print(response.body);

    if (response.statusCode == 200) {
      return getUsersList(response.body);
    } else {
      throw Exception('Unable to fetch data');
    }
  }

  List<User> getUsersList(String responseBody) {
    final parseBody = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parseBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
