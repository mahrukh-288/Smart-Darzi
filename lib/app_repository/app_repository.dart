import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smart_darzi/models/api_response.dart';

import '../app_service/app_service.dart';
import '../models/customer.dart';
import '../models/order.dart';

class AppRepository {
  AppService _appService = AppService();
  Future<ApiResponse> registerCustomer(Customer customer) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.registerCustomer(customer);
      apiResponse.isSuccess = true;
    } on DioException {
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> addOrder(Order order) async {
    print('repo');
    ApiResponse apiResponse = ApiResponse();
    try {
      print('resoponse');
      final response = await _appService.addOrder(order);
      apiResponse.isSuccess = true;
    } on DioException {
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
    }
    return apiResponse;
  }

  Future<ApiResponse> getAllOrders() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getAllOrders();

      // final parsed = json.decode(response.data).cast<Map<String, dynamic>>();
      // List<Order> orders = parsed.map<Order>((json) => Order.fromJson(json)).toList();

      final orders = List<Order>.from(
          response.data.map((e) => Order.fromJson(e)).toList());

      apiResponse.isSuccess = true;
      apiResponse.data = orders;
    } on DioException {
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
    }
    return apiResponse;
  }

 Future<ApiResponse> getAllCustomers() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getAllCustomers();

      final customers = List<Customer>.from(
          response.data.map((e) => Customer.fromJson(e)).toList());

      apiResponse.isSuccess = true;
      apiResponse.data = customers;
    } on DioException {
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
    }
    return apiResponse;
  }

   Future<ApiResponse> login(String name, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.login(name, password);
      apiResponse.isSuccess = true;
      apiResponse.successMessage = response.data['message'];
      print(response);
  
    } on DioException {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Something went wrong!';
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Something went wrong!';
    }
    return apiResponse;
  }
}
