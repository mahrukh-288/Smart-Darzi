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
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> addOrder(Order order) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.addOrder(order);

      apiResponse.isSuccess = true;
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> getAllOrders() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getAllOrders();

      final orders = List<Order>.from(
          response.data.map((e) => Order.fromJson(e)).toList());

      apiResponse.isSuccess = true;
      apiResponse.data = orders;
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
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

      apiResponse.isSuccess = true;
      apiResponse.data = customers;
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> login(String name, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.login(name, password);
      apiResponse.isSuccess = true;
      apiResponse.successMessage = response.data['message'];
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      if (e.response!.statusCode == 400) {
        apiResponse.error = 'Invalid Username or Password';
      }
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> saveSize(SizeModel size) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.saveSize(size);

      apiResponse.isSuccess = true;
      apiResponse.successMessage = response.data['message'];
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> getCustomerByPhone(int phoneNo) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getCustomerByPhone(phoneNo);

      apiResponse.isSuccess = true;
      if (response.data == "Data Not Found") {
        apiResponse.data = false;
      }
      {
        Customer customer = Customer.fromJson(response.data);
        apiResponse.data = customer;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        apiResponse.isSuccess = true;
        apiResponse.error = 'User Not Found';
      }
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

      final orders = List<Order>.from(
          response.data.map((e) => Order.fromJson(e)).toList());

      apiResponse.isSuccess = true;
      apiResponse.data = orders;
    } on DioException catch (e) {
      print(e.response?.statusMessage);
      apiResponse.error = e.response?.statusMessage;
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

  Future<ApiResponse> getCustomerSize(String customerId) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.getCustomerSize(customerId);

      SizeModel size = SizeModel.fromJson(response.data);

      apiResponse.isSuccess = true;
      apiResponse.data = size;
    } on DioException catch (e) {
      apiResponse.error = e.response?.statusMessage;
      apiResponse.isSuccess = false;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }

    Future<ApiResponse> deleteCustomer(int phoneNo) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _appService.deleteCustomer(phoneNo);
      apiResponse.isSuccess = true;
    } on DioException catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = e.response?.statusMessage;
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.error = 'Client error!';
    }
    return apiResponse;
  }
}
