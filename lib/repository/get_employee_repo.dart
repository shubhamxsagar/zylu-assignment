import 'dart:convert';

import 'package:employee/models/response/employees_response.dart';
import 'package:http/http.dart' as http;

class GetEmployee {
  Future<List<CreateEmployee>?> getEmployee() async {
    final Uri url = Uri.parse("https://employee-server-production.up.railway.app/api/getAllEmployees");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => CreateEmployee.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
