import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class EmployeeService {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://dummyjson.com/users';
  final String _cacheKey = 'cached_employees';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await _dio.get(_apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['users'];
        List<Employee> employees =
            data.map((json) => Employee.fromJson(json)).toList();

        await _cacheEmployees(employees);

        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      print('API call failed: $e');
      return await _getCachedEmployees();
    }
  }

  Future<void> _cacheEmployees(List<Employee> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(employees.map((e) => e.toJson()).toList());
    await prefs.setString(_cacheKey, encodedData);
    print('Data cached successfully: $encodedData');
  }

  Future<List<Employee>> _getCachedEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(_cacheKey);
    if (cachedData != null) {
      print('Retrieved cached data: $cachedData');
      List<dynamic> decodedData = jsonDecode(cachedData);
      return decodedData.map((json) => Employee.fromJson(json)).toList();
    } else {
      print('No cached data available');
      return [];
    }
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cacheKey);
    print('Cache cleared');
  }
}
