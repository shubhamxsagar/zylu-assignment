import 'dart:convert';

import 'package:employee/models/request/create_employee_request.dart';
import 'package:employee/models/response/employees_response.dart';
import 'package:http/http.dart' as http;

class CreateEmployeeRepository {
  Future<List<CreateEmployee>?> postEmployee(CreateEmployeeRequest postData) async {
    final Uri url = Uri.parse(
        "https://employee-server-production.up.railway.app/api/createEmployee");
    try {
      String jsonBody = jsonEncode(postData.toJson());
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonBody,
      );
      if (response.statusCode == 201) {
        print("Data posted of product successfully 201");
        return createEmployeeFromJson(response.body);
      } else {
        print("Failed to post data of product. Status code: $response");
        print("Response body: ${response.body}");

        return null;
      }
    } catch (e) {
      print("Error posting data of product : $e");
      return null;
    }
  }
}
