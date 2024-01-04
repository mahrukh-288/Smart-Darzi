import 'package:dio/dio.dart';

import '../models/customer.dart';
import '../models/order.dart';

class AppService{
final dio = Dio();

static const customerBaseUrl = 'customer';
static const orderBaseUrl = 'localhost:3000/v1/order';
 static const String   getAllCustomersUrl = '/allCustomers';




Future<Response> registerCustomer(Customer customer) async {
  
  Response response = await dio.post('http://35.153.55.88:3000/v1/user/addCustomer', data: customer.toJson());
  return response;
}

Future<Response> addOrder(Order order) async {
  print('service');
  Response response = await dio.post('$orderBaseUrl/addOrder', data: order.toJson());
  return response;
}

Future<Response> getAllOrders()async {

Response response = await dio.get('http://35.153.55.88:3000/v1/order/allOrders');

print(response.data);
return response;
}
Future<Response> getAllCustomers()async {

Response response = await dio.get('http://35.153.55.88:3000/v1/user/allCustomers');

print(response.data);
return response;
}

Future<Response> login(String name, String password)async {

Response response = await dio.post('http://35.153.55.88:3000/v1/admin/login', data: {'email':name, 'password':password});

return response;
}
}


