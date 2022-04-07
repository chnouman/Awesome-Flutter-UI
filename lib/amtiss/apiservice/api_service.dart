import 'package:flutteruilogin/amtiss/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<LoginResponseModel> login(LoginRequestModel model) async {
    String url = "https://reqres.in/api/login";
    final response = await http.post(Uri.parse(url), body: model.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
