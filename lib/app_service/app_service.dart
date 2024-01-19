import 'package:dio/dio.dart';
import 'package:smart_darzi/models/size.dart';

import '../models/customer.dart';
import '../models/order.dart';

class AppService {
  final dio = Dio();

  static const customerBaseUrl = 'http://tech.shahbaznawaz.com/v1/user';
  static const orderBaseUrl = 'http://tech.shahbaznawaz.com/v1/order';
  static const adminBaseUrl = 'http://tech.shahbaznawaz.com/v1/admin';
  static const String getAllCustomersUrl = '/allCustomers';

  Future<Response> registerCustomer(Customer customer) async {
    Response response =
        await dio.post('$customerBaseUrl/addCustomer', data: customer.toJson());

    return response;
  }

  Future<Response> addOrder(Order order) async {
    Response response =
        await dio.post('$orderBaseUrl/addOrder', data: order.toJson());

    return response;
  }

  Future<Response> getAllOrders() async {
    Response response = await dio.get('$orderBaseUrl/allOrders');

    return response;
  }

  Future<Response> getAllCustomers() async {
    Response response = await dio.get('$customerBaseUrl/allCustomers');

    return response;
  }

  Future<Response> login(String name, String password) async {
   
    Response response = await dio.post('$adminBaseUrl/login', 
        data: {'email': name, 'password': password}, );

    return response;
  }

  Future<Response> saveSize(SizeModel size) async {
    Response response =
        await dio.post('$customerBaseUrl/addSize', data: size.toJson());

    return response;
  }

  Future<Response> getCustomerByPhone(int phoneNo) async {
    Response response = await dio.get('$customerBaseUrl/oneCustomer',
        queryParameters: {'phoneNumber': phoneNo});

    return response;
  }

  Future<Response> getOrdersByCustomerId(String customerId) async {
    Response response = await dio.get('$orderBaseUrl/allOrdersBySingleUser',
        queryParameters: {'customerId': customerId});

    return response;
  }

  Future<Response> getCustomerSize(String customerId) async {
    Response response = await dio.get('$customerBaseUrl/getSize',
        queryParameters: {'customerId': customerId});

    return response;
  }

  Future<Response> deleteCustomer(int phoneNo) async {
    Response response = await dio.delete('$customerBaseUrl/deleteCustomer',
        data: {'phoneNumber': phoneNo});

    return response;
  }
}
