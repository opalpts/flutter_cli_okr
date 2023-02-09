import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
// import 'package:http/http.dart';
import 'dart:developer';
import '../verify/verify_binding.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController
  final _connect = GetConnect();
  var isActive = false.obs;
  var moblie = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    moblie.dispose();
    super.dispose();
  }

  void sendOtp(number) async {
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ0eXBlIjoiYnJhbmQiLCJ0b2tlbl9pZCI6IjljMGFlZmQ3LWM4NWYtNGZlMC04MDdhLTgzNjI2MDY3NzhiZiIsImlzcyI6ImJjcm0iLCJzdWIiOiJJRF9CSkFaa3NyRGtSbGUiLCJicmFuZF9yZWYiOiJCVFNJVDE3WEM5Wk0iLCJwcm92aWRlcl9yZWYiOiJQVkc1ZlBoQzlOV1ltZCIsInNjb3BlIjoiSW50ZXJuYWwiLCJleHAiOjE2NzU5Mjc5MzgsImlhdCI6MTY3NTkwOTkzOSwicGF5bG9hZCI6eyJzdGF0ZSI6ImxpbmUiLCJpZGVudGl0eVNSZWYiOiJJRF9CSkFaa3NyRGtSbGUiLCJjdXN0b21lcklkIjo4fX0.wUqkzEqs1CmsPNHYkYBD1wz5VgcpCK2YEevViRifUNge9e8ahLkWWUUBf4d3o8SueOagHK8FG1jZLg0tyLiVLg';
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await _connect.post(
        'https://krypton-template-api.azurewebsites.net/internal/v1/sms/requestotp',
        {
          'mobile_no': number,
        },
        headers: headers);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = response.body;
      log(jsonEncode(response.body));
      Get.toNamed("/verify", arguments: [
        {
          "transactionId": data['data']['resp']['transaction_id'],
          "otpReference": data['data']['resp']['otp_reference'],
          "expireTime": data['data']['resp']['expire_time'],
          "mobile": moblie.value.text
        }
      ]);
    } else {
      log('error');
    }
  }
}
