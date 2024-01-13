import 'package:dio/dio.dart';
import 'package:smart_darzi/models/size.dart';

import '../models/customer.dart';
import '../models/order.dart';

class AppService{
final dio = Dio();

static const customerBaseUrl = 'http://35.153.55.88:3000/v1/user';
static const orderBaseUrl = 'http://35.153.55.88:3000/v1/order';
static const adminBaseUrl = 'http://35.153.55.88:3000/v1/admin';
 static const String   getAllCustomersUrl = '/allCustomers';




Future<Response> registerCustomer(Customer customer) async {
  print(customer.toJson());
  Response response = await dio.post('$customerBaseUrl/addCustomer', data: customer.toJson());
  print(response);
  return response;
}

Future<Response> addOrder(Order order) async {
  print(order.toJson());
  Response response = await dio.post('$orderBaseUrl/addOrder', data: order.toJson());
  print(response);
  return response;
}

Future<Response> getAllOrders()async {

Response response = await dio.get('$orderBaseUrl/allOrders');

print(response.data);
return response;
}
Future<Response> getAllCustomers()async {

Response response = await dio.get('$customerBaseUrl/allCustomers');
print(response);
return response;
}

Future<Response> login(String name, String password)async {

Response response = await dio.post('$adminBaseUrl/login', data: {'email':name, 'password':password});
if(response.statusCode == 400){
  print('Invalid credentials');
}

print(response);
return response;
}

Future<Response> saveSize(SizeModel size)async {
  print(size.toJson());

Response response = await dio.post('$customerBaseUrl/addSize', data: size.toJson());
print(response);
return response;
}

Future<Response> getCustomerByPhone(int phoneNo )async {
  
print(phoneNo);
Response response = await dio.get('$customerBaseUrl/oneCustomer', queryParameters: {'phoneNumber' : phoneNo});

if(response.statusCode == 404) {
  print('Phone does not Exists');
}
else if(response.statusCode == 200){
  print('Phone Exists');

}
print('Response data : $response');

return response;
}

Future<Response> getOrdersByCustomerId(String customerId )async {
//print('order by cid service');


Response response = await dio.get('$orderBaseUrl/allOrdersBySingleUser', queryParameters: {'customerId': customerId});

return response;
}

Future<Response> getCustomerSize(String customerId )async {
print('customer size');
Response response = await dio.get('$customerBaseUrl/getSize', queryParameters: {'customerId': customerId});

return response;
}
}


