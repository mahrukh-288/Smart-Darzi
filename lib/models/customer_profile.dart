import 'package:smart_darzi/models/size.dart';

import 'customer.dart';
import 'order.dart';

class CustomerProfile{
 Customer customer;
SizeModel size;
List<Order> orders;

CustomerProfile({required this.customer, required this.size, required this.orders});


}