import 'dart:convert';

import 'package:machinemaintainapp/ui/customers/customer_list/model/customer_response.dart';
import 'package:machinemaintainapp/ui/login/model/login_response.dart';

import '../utills/const_string.dart';
import 'session_manager.dart';

class SessionHelper {
  SessionHelper._();

  static final SessionHelper _instance = SessionHelper._();

  factory SessionHelper() {
    return _instance;
  }





  /// home seen
  Future<void> sethomeseen(bool status) async {
    // save user values in shared pref
    await SessionManager.setBoolValue('S_P_home', status);
  }

  Future<bool?> gethomeseenResponse() async {
    bool response = await SessionManager.getBoolValue('S_P_home');
    return response;
  }

  Future<void> setLogin(bool login) async {
    // save user values in shared pref
    await SessionManager.setBoolValue('login', login);
  }

  Future<bool?> getLogin() async {
    bool response = await SessionManager.getBoolValue('login');
    return response;
  }


  Future<void> setIntro(int status) async {
    // save user values in shared pref
    await SessionManager.setIntValue(spIntro, status);
  }

  Future<int?> getIntro() async {
    int response = await SessionManager.getIntValue(spIntro);
    return response;
  }
  // Future<void> setCustomerData(CustomerResponse response) async {
  //   // save user values in shared pref
  //   await SessionManager.setStringValue(spLoginResponse, json.encode(response.toJson()));
  // }
  // Future<CustomerResponse?> getCustomerData() async {
  //   String response = await SessionManager.getStringValue(spLoginResponse);
  //   return CustomerResponse.fromJson(json.decode(response));
  // }

  /// set login response in shared pref
  Future<void> setLoginResponse(LoginResponse response) async {
    // save user values in shared pref
    await SessionManager.setStringValue(spLoginResponse, json.encode(response.toJson()));
  }

  Future<LoginResponse?> getLoginResponse() async {
    String response = await SessionManager.getStringValue(spLoginResponse);
    return LoginResponse.fromJson(json.decode(response));
  }


}
