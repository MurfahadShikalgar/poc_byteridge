// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:practice_application/features/sign_up/data/models/register_model.dart';

abstract class RegisterDataSource {
  Future<RegisterModel> getRegisterDataSource(Map body);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<RegisterModel> getRegisterDataSource(Map body) async {
    String url = dotenv.env['SIGNUP_API'].toString();
    Uri uri = Uri.parse(url);
    var bodyy = {"email": "aa.byteridge@gmail.com", "password": "Byteridge"};
    Response response = await post(uri, body: bodyy);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return RegisterModel.fromJson(decodedData);
    } else {
      throw Error();
    }
  }
}


// Future<Response> getRegisterDataSource(Map body) async {
//   String url = dotenv.env['SIGNUP_API'].toString();
//   Uri uri = Uri.parse(url);
//   var bodyy = {"email": "aa.byteridge@gmail.com", "password": "Byteridge"};
//   Response response = await post(uri, body: bodyy);
//   return response;
// }
