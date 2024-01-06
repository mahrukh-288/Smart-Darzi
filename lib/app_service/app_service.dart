import 'package:dio/dio.dart';
import 'package:smart_darzi/models/size.dart';

import '../models/customer.dart';
import '../models/order.dart';

class AppService{
final dio = Dio();

static const customerBaseUrl = 'customer';
static const orderBaseUrl = 'localhost:3000/v1/order';
 static const String   getAllCustomersUrl = '/allCustomers';




Future<Response> registerCustomer(Customer customer) async {
  
  Response response = await dio.post('http://localhost:3000/v1/user/addCustomer', data: customer.toJson());
  print(response);
  return response;
}

Future<Response> addOrder(Order order) async {
  print(order.toJson());
  Response response = await dio.post('http://localhost:3000/v1/order/addOrder', data: order.toJson());
  print(response);
  return response;
}

Future<Response> getAllOrders()async {

Response response = await dio.get('http://localhost:3000/v1/order/allOrders');

print(response.data);
return response;
}
Future<Response> getAllCustomers()async {

Response response = await dio.get('http://localhost:3000/v1/user/allCustomers');
print(response);
return response;
}

Future<Response> login(String name, String password)async {

Response response = await dio.post('http://localhost:3000/v1/admin/login', data: {'email':name, 'password':password});
print(response);
return response;
}

Future<Response> saveSize(SizeModel size)async {
  print(size.toJson());

Response response = await dio.patch('http://localhost:3000/v1/user/addSize', data: size.toJson());
print(response);
return response;
}

Future<Response> getCustomerByPhone(String phoneNo )async {
  
print(phoneNo);
Response response = await dio.get('http://localhost:3000/v1/user/oneCustomer', data: {"phoneNumber" : 3041234567});
print(response.data);
return response;
}

Future<Response> getOrdersByCustomerId(String customerId )async {
print('order by cid service');
Response response = await dio.get('http://localhost:3000/v1/order/oneOrder', data: {"customerId" : customerId});
print(response.data);
return response;
}

}


