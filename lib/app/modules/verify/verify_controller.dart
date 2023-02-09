import 'package:get/get.dart';
import 'dart:developer';
import 'dart:convert';
import 'dart:async';

class VerifyController extends GetxController {
  final _connect = GetConnect();
  var argumentData = Get.arguments;
  var isActive = false.obs;
  var otp = "".obs;
  var ref = "".obs;
  var mobile = "".obs;
  var transactionId = "".obs;

  var second = 60.obs;
  late Timer timer;
  var secondActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    log(argumentData[0]['transactionId']);
    log(argumentData[0]['otpReference']);
    log(argumentData[0]['expireTime']);
    log(argumentData[0]['mobile']);
    transactionId.value = argumentData[0]['transactionId'];
    ref.value = argumentData[0]['otpReference'];
    mobile.value = "0${argumentData[0]['mobile']}";
    countdownTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void verifyOtp() async {
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ0eXBlIjoiYnJhbmQiLCJ0b2tlbl9pZCI6IjQ2YmU3MzgxLTMzMWMtNGU0Zi1hMGM3LTc5MWFjZDE1ZGExYyIsImlzcyI6ImJjcm0iLCJzdWIiOiJJRF9CSkFaa3NyRGtSbGUiLCJicmFuZF9yZWYiOiJCVFNJVDE3WEM5Wk0iLCJwcm92aWRlcl9yZWYiOiJQVkc1ZlBoQzlOV1ltZCIsInNjb3BlIjoiSW50ZXJuYWwiLCJleHAiOjE2NzU5NTQxODIsImlhdCI6MTY3NTkzNjE4MiwicGF5bG9hZCI6eyJzdGF0ZSI6ImxpbmUiLCJpZGVudGl0eVNSZWYiOiJJRF9CSkFaa3NyRGtSbGUiLCJjdXN0b21lcklkIjo4fX0.btDa0U8OYHeRSV2NlswIVlEVwy5eTRMfuWxWUfY3I9p6UpVg8khQ4ueYZhG5IcAFDqG4Vu-Tp4SMfIodNtmKow';
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await _connect.post(
        'https://krypton-template-api.azurewebsites.net/internal/v1/sms/verify',
        {
          'transaction_id': transactionId.value,
          'mobile_no': argumentData[0]['mobile'],
          'otp': otp.value,
        },
        headers: headers);
    log(response.statusCode.toString());
    log(jsonEncode(response.body));
    if (response.statusCode == 200) {
      log('success');
    } else {
      log('error');
    }
  }

  void countdownTimer() {
    second = 60.obs;
    secondActive.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second == 0) {
        secondActive.value = true;
        timer.cancel();
      } else {
        second = second--;
        log(second.toString());
      }
      log(secondActive.value.toString());
    });
  }

  void resentOtp() async {
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ0eXBlIjoiYnJhbmQiLCJ0b2tlbl9pZCI6IjljMGFlZmQ3LWM4NWYtNGZlMC04MDdhLTgzNjI2MDY3NzhiZiIsImlzcyI6ImJjcm0iLCJzdWIiOiJJRF9CSkFaa3NyRGtSbGUiLCJicmFuZF9yZWYiOiJCVFNJVDE3WEM5Wk0iLCJwcm92aWRlcl9yZWYiOiJQVkc1ZlBoQzlOV1ltZCIsInNjb3BlIjoiSW50ZXJuYWwiLCJleHAiOjE2NzU5Mjc5MzgsImlhdCI6MTY3NTkwOTkzOSwicGF5bG9hZCI6eyJzdGF0ZSI6ImxpbmUiLCJpZGVudGl0eVNSZWYiOiJJRF9CSkFaa3NyRGtSbGUiLCJjdXN0b21lcklkIjo4fX0.wUqkzEqs1CmsPNHYkYBD1wz5VgcpCK2YEevViRifUNge9e8ahLkWWUUBf4d3o8SueOagHK8FG1jZLg0tyLiVLg';
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await _connect.post(
        'https://krypton-template-api.azurewebsites.net/internal/v1/sms/resend',
        {
          'mobile_no': argumentData[0]['mobile'],
        },
        headers: headers);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('success');
      log(jsonEncode(response.body));
      final data = response.body;
      ref.value = data['data']['resp']['otp_reference'];
      transactionId.value = data['data']['resp']['transaction_id'];
      countdownTimer();
    } else {
      log('error');
    }
  }
}
