import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/app_repository/app_repository.dart';
import 'package:smart_darzi/app_service/app_service.dart';
import 'package:equatable/equatable.dart';
import '../../models/api_response.dart';
import '../../models/order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  AppRepository _appRepository = AppRepository();
  OrderCubit() : super(OrderInitial());


  addOrder(Order order)async {
   emit(LoadingOrder());
    ApiResponse response = await _appRepository.addOrder(order);
    if(response.isSuccess){
    
      emit(OrderAdded());
    }
    else{
      emit(OrderRegistrationFailed(error: response.error!));
    }
    
  }

  getAllOrders() async {
    emit(LoadingOrder());
ApiResponse response = await _appRepository.getAllOrders();
if(response.isSuccess){
    
      emit(AllOrdersFetched(orders: response.data ));
    }
  }

  
  getOrdersByCustomerId(String customerId) async {
    //emit(LoadingOrder());
ApiResponse response = await _appRepository.getOrdersByCustomerId(customerId);
if(response.isSuccess){
    
      emit(OrdersByCustomerIdFetched(orders: response.data ));
    }
    else{
      emit(OrderFailure());
    }
  }

  addEmbroidary(bool embroidary){
    if(embroidary) {
      emit(AddEmbroidaryState());
    }
    else{
      emit(NoEmbroidaryState());
    }
  }
}
