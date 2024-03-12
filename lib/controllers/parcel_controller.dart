import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api.dart';
import '../models/response_model.dart';

class ParcelController extends GetxController{

  RxList<ParcelModel> parcel_list = <ParcelModel>[].obs;
  Rx<bool> isLoading = false.obs;

  late SharedPreferences prefs;

  @override
  void onInit() async{
    getAllParcel();
    super.onInit();
  }

  void getAllParcel() async{

    prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString("authToken");
    var headers = {
      'Content-Type': 'application/json',
      'x-auth-token':  authToken!
    };
    var request = http.Request('GET', Uri.parse('${apiUrl}parcels?page=4&shopId=shop-123'));
    print(request.body);
    request.headers.addAll(headers);
    try {
      isLoading.value = true;
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        var resonseData = responseModelFromJson(data);
        print(resonseData.content);
      }else if(response.statusCode == 200){
        Get.showSnackbar(const GetSnackBar(
          message: "Access Denied. Invalid Token",
          duration: Duration(seconds: 2),
        ));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error from getAllParcel: ${e.toString()}");
    }
  }

}