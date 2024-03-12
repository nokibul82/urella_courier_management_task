import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/api.dart';

class LoginController extends GetxController {
  late SharedPreferences prefs;
  Rx<bool> isAuth = false.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    String? authToken;
    authToken = prefs.getString("authToken");
    try {
      if (authToken!.isNotEmpty) {
        isAuth.value = true;
        print("isAuth: true");
      }
    } catch (e) {
      prefs.setString("authToken", "");
      print("Error from login init: ${e.toString()}");
      Get.showSnackbar(const GetSnackBar(
        title: "Error from login init",
        message: "Error from login init",
        duration: Duration(seconds: 2),
      ));
    }
    super.onInit();
  }

  void login(String phone, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('${apiUrl}auth/login'));
    request.body = json.encode({"phone": phone, "password": password});
    print(request.body);
    request.headers.addAll(headers);
    try {
      isLoading.value = true;
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode( await response.stream.bytesToString());
        print("login successfull !");
        prefs.setString("authToken", data['token']);
        isAuth.value = true;
      }else if(response.statusCode == 400){
        Get.showSnackbar(const GetSnackBar(
          message: "Something went worng. Please fill up phone and password and try again",
          duration: Duration(seconds: 3),
        ));
      }
      else{
        var data = json.decode( await response.stream.bytesToString())["message"];
        Get.showSnackbar(GetSnackBar(
          message: data,
          duration: const Duration(seconds: 2),
        ));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error from login: ${e.toString()}");
    }
  }

  void logout(){
    isLoading.value = true;
    prefs.setString("authToken", "");
    isAuth.value = false;
    isLoading.value = false;
  }

}
