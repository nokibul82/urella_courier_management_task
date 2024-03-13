import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api.dart';
import '../models/response_model.dart';

class ParcelController extends GetxController {
  RxList<ParcelModel> parcel_list = <ParcelModel>[].obs;
  RxList<ParcelModel> filtered_list = <ParcelModel>[].obs;
  Rx<bool> isLoading = false.obs;

  late SharedPreferences prefs;

  @override
  void onInit() async {
    getAllParcel();
    super.onInit();
  }

  void getAllParcel() async {
    parcel_list.clear();
    filtered_list.clear();
    prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString("authToken");
    var page = 1;
    var headers = {
      'Content-Type': 'application/json',
      'x-auth-token': authToken!
    };
    while (true) {
      var request = http.Request(
          'GET', Uri.parse('${apiUrl}parcels?page=$page&shopId=shop-123'));
      request.headers.addAll(headers);
      try {
        isLoading.value = true;
        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        if (response.statusCode == 200) {
          var data = await response.stream.bytesToString();
          var resonseData = responseModelFromJson(data);
          if (resonseData.content.isEmpty) {
            break;
          }
          parcel_list.addAll(resonseData.content);
          filtered_list.addAll(parcel_list);
          print(parcel_list.length);
        } else if (response.statusCode == 401) {
          Get.showSnackbar(const GetSnackBar(
            message: "Access Denied. Invalid Token",
            duration: Duration(seconds: 2),
          ));
        } else {
          var data =
              json.decode(await response.stream.bytesToString())["message"];
          Get.showSnackbar(const GetSnackBar(
            message: "data",
            duration: Duration(seconds: 2),
          ));
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        print("Error from getAllParcel: ${e.toString()}");
      }
      page++;
    }
    isLoading.value = false;
  }

  Future<void> createParcel(
      {required String merchantOrderId,
      required String recipientName,
      required String recipientPhone,
      required String recipientCity,
      required String recipientArea,
      required String recipientZone,
      required String recipientAddress,
      required int amountToCollect,
      required int stockPrice,
      required String itemDescription,
      required int itemQuantity,
      required int itemWeight,
      required String specialInstruction,
      required String shopId}) async {
    prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString("authToken");
    var headers = {
      'Content-Type': 'application/json',
      'x-auth-token': authToken!
    };
    var request = http.Request('POST', Uri.parse('${apiUrl}parcels/create'));
    request.body = json.encode({
      "merchantOrderId": merchantOrderId,
      "recipientName": recipientName,
      "recipientPhone": recipientPhone,
      "recipientCity": recipientCity,
      "recipientArea": recipientArea,
      "recipientZone": recipientZone,
      "recipientAddress": recipientAddress,
      "amountToCollect": amountToCollect,
      "stockPrice": stockPrice,
      "itemDescription": itemDescription,
      "itemQuantity": itemQuantity,
      "itemWeight": itemWeight,
      "specialInstruction": specialInstruction,
      "shopId": shopId
    });
    request.headers.addAll(headers);
    try {
      isLoading.value = true;
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.showSnackbar(const GetSnackBar(
          message: "Parcel Created",
          duration: Duration(seconds: 2),
        ));
      } else if (response.statusCode == 401) {
        Get.showSnackbar(const GetSnackBar(
          message: "Access Denied. Invalid Token",
          duration: Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Something went wrong. Please try again",
          duration: Duration(seconds: 2),
        ));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error from createParcel: ${e.toString()}");
    }
  }

  Future<void> updateParcel(
      {required String id,
      required String merchantOrderId,
      required String recipientName,
      required String recipientPhone,
      required String recipientCity,
      required String recipientArea,
      required String recipientZone,
      required String recipientAddress,
      required int amountToCollect,
      required int stockPrice,
      required String itemDescription,
      required int itemQuantity,
      required int itemWeight,
      required String specialInstruction}) async {
    prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString("authToken");
    var headers = {
      'Content-Type': 'application/json',
      'x-auth-token': authToken!
    };
    var request = http.Request('PUT', Uri.parse('${apiUrl}parcels/update/$id'));
    request.body = json.encode({
      "merchantOrderId": merchantOrderId,
      "recipientName": recipientName,
      "recipientPhone": recipientPhone,
      "recipientCity": recipientCity,
      "recipientArea": recipientArea,
      "recipientZone": recipientZone,
      "recipientAddress": recipientAddress,
      "amountToCollect": amountToCollect,
      "stockPrice": stockPrice,
      "itemDescription": itemDescription,
      "itemQuantity": itemQuantity,
      "itemWeight": itemWeight,
      "specialInstruction": specialInstruction,
    });
    request.headers.addAll(headers);
    try {
      isLoading.value = true;
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if(response.statusCode == 200){
        Get.showSnackbar(const GetSnackBar(
          message: "Parcel Updated",
          duration: Duration(seconds: 2),
        ));
      }else if(response.statusCode == 401) {
        Get.showSnackbar(const GetSnackBar(
          message: "Access Denied. Invalid Token",
          duration: Duration(seconds: 2),
        ));
      }else{
        Get.showSnackbar(const GetSnackBar(
          message: "Something went wrong. Please try again",
          duration: Duration(seconds: 2),
        ));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error from updateParcel: ${e.toString()}");
    }
  }

  void searchParcel(String query) async {
    isLoading.value = true;
    filtered_list.clear();
    if (query.isEmpty) {
      filtered_list.assignAll(parcel_list);
    } else {
      filtered_list.assignAll(parcel_list.where((parcel) =>
          parcel.recipientName.toLowerCase().contains(query.toLowerCase()) ||
          parcel.recipientPhone.toLowerCase().contains(query.toLowerCase()) ||
          parcel.recipientCity.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
