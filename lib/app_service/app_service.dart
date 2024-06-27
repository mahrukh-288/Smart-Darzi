import 'package:dio/dio.dart';
import 'package:smart_darzi/models/size.dart';

import '../models/customer.dart';
import '../models/order.dart';

class AppService {
  final dio = Dio();

static const baseUrl = 'http://35.153.55.88:3000/v1';
  static const customerBaseUrl = '$baseUrl/user';
  static const orderBaseUrl = '$baseUrl/order';
  static const adminBaseUrl = '$baseUrl/admin';
  static const String getAllCustomersUrl = '/allCustomers';

  Future<Response> registerCustomer(Customer customer) async {
    print(customer.toJson());
    Response response =
        await dio.post('$customerBaseUrl/addCustomer', data: customer.toJson());

print(response.data);
    return response;
  }

  Future<Response> addOrder(Order order) async {
    print(order.toJson());
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
print(response);
    return response;
  }

  Future<Response> login(String name, String password) async {
   
    Response response = await dio.post('$adminBaseUrl/login', 
        data: {'email': name, 'password': password}, );
print(response.data);
    return response;
  }

  Future<Response> saveSize(SizeModel size) async {
    Response response =
        await dio.post('$customerBaseUrl/addSize', data: size.toJson());

    return response;
  }

Future<Response> updateSize(SizeModel size) async {
    Response response =
        await dio.patch('$customerBaseUrl/updateSize', data: size.toJson());

    return response;
  }

  Future<Response> getCustomerByPhone(int phoneNo) async {
    Response response = await dio.get('$customerBaseUrl/oneCustomer',
        queryParameters: {'queryText': phoneNo, 'type': 'phoneNumber'});
print(response.data);
    return response;
  }
   Future<Response> getCustomerById(int id) async {
    Response response = await dio.get('$customerBaseUrl/oneCustomer',
        queryParameters: {'queryText': id, 'type': 'id'});

    return response;
  }
   Future<Response> getCustomerByName(String name) async {
    Response response = await dio.get('$customerBaseUrl/oneCustomer',
        queryParameters: {'queryText': name, 'type': 'name'});

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

    print(phoneNo);
    Response response = await dio.delete('$customerBaseUrl/deleteCustomer',
        data: {'phoneNumber': phoneNo.toString()});

    return response;
  }

   Future<Response> getCustomerProfile(String customerId) async {


    Response response = await dio.get('$customerBaseUrl/customerProfile',
        queryParameters: {'customerId': customerId});

    return response;
  }
}
