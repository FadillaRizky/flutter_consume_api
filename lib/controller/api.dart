
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_consume_api/model/ListUserResponse.dart';

class Api{
  static Future<ListUserResponse> getListUser(int currentPage ) async {
    var url = "https://reqres.in/api/users?page=$currentPage";
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return ListUserResponse.fromJson(jsonDecode(response.body));
    }
    throw "Gagal request list User:\n${response.body}";
  }
}