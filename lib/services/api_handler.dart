import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../resources/string_manager.dart';
import 'api_consts.dart';

class APIHandler {
  static Future<dynamic> getData({required String target}) async {
    try {
      String url = '${APIConsts.BASE_URL}${APIConsts.UNENCODED_PATH}$target';

      var response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw data['message'];
      }
    } on SocketException {
      // Internet connection error
      throw AppString.checkInternetConnection;
    } on FormatException {
      // Error from the backend
      throw AppString.formatException;
    } catch (exception) {
      throw exception.toString();
    }
  }
}
