import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smart_darzi/models/api_response.dart';
import 'package:smart_darzi/models/size.dart';

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
      print('my response');
      print(response);
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

      final customers = List<Customer>.from(response.data.map((e) {
        Customer c = Customer.fromJson(e);

        return c;
      }).toList());
      print(customers);
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

  Future<ApiResponse> saveSize(SizeModel size) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.saveSize(size);
      print('repo');
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

  Future<ApiResponse> getCustomerByPhone(int phoneNo) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getCustomerByPhone(phoneNo);
      print(response);
      apiResponse.isSuccess = true;
      if(response.data == "Data Not Found"){
        apiResponse.data = false;
      }
      {
      Customer customer = Customer.fromJson(response.data);
      apiResponse.data = customer;
      }
    } on DioException {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Server Error while getting customer by phone!';
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client Error while getting customer by phone!';
    }
    return apiResponse;
  }

 Future<ApiResponse> getOrdersByCustomerId(String customerId) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getOrdersByCustomerId(customerId);

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

Future<ApiResponse> getCustomerSize(String customerId) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getCustomerSize(customerId);


     SizeModel size = SizeModel.fromJson(response.data);
print(size.toJson());
      apiResponse.isSuccess = true;
      apiResponse.data = size;
    } on DioException {
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
    }
    return apiResponse;
  }
}
