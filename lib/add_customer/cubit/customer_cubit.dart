import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_darzi/app_repository/app_repository.dart';
import 'package:equatable/equatable.dart';
import '../../models/api_response.dart';
import '../../models/customer.dart';
import '../../models/size.dart';

part 'customer_state.dart';

AppRepository _appRepository = AppRepository();

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  registerCustomer(Customer customer) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.registerCustomer(customer);
    if (response.isSuccess) {
      emit(CustomerRegistered());
    } else {
      emit(Failure(error: response.error!));
    }
  }

  getAllCustomers() async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getAllCustomers();
    if (response.isSuccess) {
      print('response in state');
      emit(AllCustomersFetched(customers: response.data));
    } else {
      emit(Failure(error: response.error!));
    }
  }

  login(String name, String password) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.login(name, password);
    if (response.isSuccess) {
      emit(LoggedIn());
    } else {
      emit(Failure(error: response.error!));
    }
  }

  saveSize(SizeModel size) async {
    print(size.toJson());
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.saveSize(size);
    if (response.isSuccess) {
      print(state);
      emit(SizeSaved());
    } else {
      emit(Failure(error: response.error!));
    }
  }

  getCustomerByPhone(int phoneNo) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerByPhone(phoneNo);
    if (response.isSuccess) {
      if(response.data != null){
      emit(CustomerFetchedByPhone(available: true, customer: response.data));}
      else{
        emit(CustomerNotAvailable(available: false));
      }
     
    } else {
      emit(Failure(error: response.error!));
    }
  }

  getCustomerSize(String customerId) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerSize(customerId);
    if (response.isSuccess) {
      print(response.data);
     emit(CustomerSizeFetched(size: response.data));
    } else {
      emit(Failure(error: response.error!));
    }
  }

  getProfile(int phoneNo) async {
     emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerByPhone(phoneNo);
    if (response.isSuccess) {
      
      if (response.data == "Data Not Found") {
        emit(const CustomerNotAvailable(available: false));
      } else {
        Customer  customer = response.data;
        response = await _appRepository.getCustomerSize(customer.id);
        //emit(CustomerFetchedByPhone(customer: response.data));
      }
    } else {
      emit(Failure(error: response.error!));
    }
  }
}
