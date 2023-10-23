import 'dart:convert';


import '../../session/session_manager.dart';




/////////////////////////////////////////////     USE FOR SESSION MANAGER /////////////////////////////////////////////////////////






class SessionHelper {
  SessionHelper._();

  static final SessionHelper _instance = SessionHelper._();

  factory SessionHelper() {
    return _instance;
  }

  Future<void> sethomeseen(bool status) async {
    // save user values in shared pref
    await SessionManager.setBoolValue('S_P_home', status);
  }

  Future<bool?> gethomeseenResponse() async {
    bool response = await SessionManager.getBoolValue('S_P_home');
    return response;
  }
  // Future<void> setUserModel(User response) async {
  //   // save user values in shared pref
  //   await SessionManager.setStringValue(
  //       spLoginResponse, json.encode(response.toJson()));
  // }
  //
  // Future<User?> getAdminModel() async {
  //   String response = await SessionManager.getStringValue(spLoginResponse);
  //   return User.fromJson(json.decode(response));
  // }

}

  // Todo:Difficulty Level

 /* Future<void> setLoginData(LoginData loginResponce) async {
    // save user values in shared pref
    await SessionManager.setStringValue(
        SpString.spDifficulty, jsonEncode(loginResponce.toJson()));

    print('LoginData IN SP ${loginResponce}');
  }

  static LoginData? loginSavedData;

  Future<LoginData?> getLoginData() async {
    String response =
        await SessionManager.getStringValue(SpString.spDifficulty);
    if (CheckNullData.checkNullOrEmptyString(response)) {
      return null;
    } else {
      log(response);
      //String data = json.decode(response);
      return LoginData.fromJson(jsonDecode(response));
    }
  }
}*/
