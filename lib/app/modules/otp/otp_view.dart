import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'otp_controller.dart';

import '../../../body_widget.dart';
import 'dart:developer';
import 'dart:convert';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: BackgroundWidget(
              child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Image.asset(
                    "assets/image/logo.png",
                    height: 100,
                    width: 130,
                  )),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text('กรุณากรอกเบอร์มือถือเพื่อ\nรับขอรหัส OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLength: 9,
                  controller: controller.moblie,
                  onChanged: (String newVal) {
                    if (newVal.length == 9) {
                      controller.isActive.value = true;
                    } else {
                      controller.isActive.value = false;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "เบอร์โทรศัพท์",
                    icon: Text('+66', style: TextStyle(fontSize: 20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              _button(),
            ]),
          )));
    });
  }

  Widget _button() {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 48),
                  backgroundColor: Colors.greenAccent,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                  onSurface: const Color(0xFFA4A3A1),
                ),
                onPressed: controller.isActive.value
                    ? () async {
                        controller.sendOtp(controller.moblie.text);
                        // final data = jsonDecode(resp);
                        // if (resp.statusCode == 200) {
                        //   log('200');
                        //   // Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //     builder: (context) => Otp(
                        //   //         transactionId: data['data']['resp']
                        //   //             ['transaction_id'],
                        //   //         otpReference: data['data']['resp']
                        //   //             ['otp_reference'],
                        //   //         expireTime: data['data']['resp']
                        //   //             ['expire_time'],
                        //   //         mobile: controller.moblie.text),
                        //   //   ),
                        //   // );
                        // } else {
                        //   log('400');
                        //   // showDialog(
                        //   //     context: context,
                        //   //     builder: (context) {
                        //   //       return const AlertDialog(
                        //   //         title: Text("error!!"),
                        //   //         content: Text("error!!"),
                        //   //       );
                        //   //     });
                        // }
                      }
                    : null,
                child: const Text('ยืนยัน'),
              ),
            )));
  }
}
