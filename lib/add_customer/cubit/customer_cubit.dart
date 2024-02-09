import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';
import 'package:smart_darzi/app_repository/app_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_darzi/customer_profile/customer_profile.dart';
import 'package:smart_darzi/models/customer_profile.dart';
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
      getCustomerByPhone(customer.phoneNumber);
     // emit(CustomerRegistered());
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }

  getAllCustomers() async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getAllCustomers();
    if (response.isSuccess) {
      emit(AllCustomersFetched(customers: response.data));
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }

  login(String name, String password) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.login(name, password);
    if (response.isSuccess) {
      emit(LoggedIn());
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }

  saveSize(SizeModel size) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.saveSize(size);
    if (response.isSuccess) {
      emit(SizeSaved(message: response.successMessage!));
    } 
   
  }
   updateSize(SizeModel size) async {
    print('updating');
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.updateSize(size);
    if (response.isSuccess) {
      emit(SizeSaved(message: response.successMessage!));
    } 
   
  }

  getCustomerByPhone(int phoneNo) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerByPhone(phoneNo);
    if (response.isSuccess) {
      if (response.data != null) {
        emit(CustomerFetchedByPhone(customer: response.data));
      } else {
        emit(const CustomerNotAvailable(available: false));
      }
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }
  getCustomerById(int id) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerById(id);
    if (response.isSuccess) {
      if (response.data != null) {
        emit(CustomerFetchedByPhone(customer: response.data));
      } else {
        emit(const CustomerNotAvailable(available: false));
      }
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }
  getCustomerByName(String name) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerByName(name);
    if (response.isSuccess) {
      if (response.data != null) {
        emit(CustomerFetchedByPhone(customer: response.data));
      } else {
        emit(const CustomerNotAvailable(available: false));
      }
    } 
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }

  getCustomerSize(String customerId) async {
    //emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerSize(customerId);
    if (response.isSuccess) {
      emit(CustomerSizeFetched(size: response.data));
    }
    else {
      emit(SizeNotAvailable());
    }
  }

   deleteCustomer(int phoneNo) async {
    emit(LoadingCustomer());
    ApiResponse response = await _appRepository.deleteCustomer(phoneNo);
    if (response.isSuccess) {
      emit(CustomerDeleted());
    } else {
      emit(FailureInDeletingCustomer(error: response.error!));
    }
  }

    getCustomerProfile(String customerId) async {
      print('customer id : $customerId');
    //emit(LoadingCustomer());
    ApiResponse response = await _appRepository.getCustomerProfile(customerId);
    print('response is ${response.data}');
    if (response.isSuccess) {
      emit(CustomerProfileFetched(profile: response.data));
    }
    // else {
    //   emit(Failure(error: response.error!));
    // }
  }
}
