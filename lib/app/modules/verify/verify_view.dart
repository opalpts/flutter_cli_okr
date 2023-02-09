import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'verify_controller.dart';

import '../../../body_widget.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'dart:developer';

class VerifyView extends GetView<VerifyController> {
  const VerifyView({Key? key}) : super(key: key);
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
            const Text('กรุณากรอก OTP\nเพื่อยืนยันตัวตน',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text('รหัส OTP ได้ส่งไปยัง  ${controller.mobile.value}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12)),
            ),
            OtpTextField(
              numberOfFields: 6,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderColor: const Color(0xFF80B7A2),
              focusedBorderColor: const Color(0xFF80B7A2),
              showFieldAsBox: true,
              fieldWidth: 50,
              onCodeChanged: (String code) {
                if (code.isNotEmpty) {
                  controller.isActive.value = true;
                } else {
                  controller.isActive.value = false;
                }
              },
              onSubmit: (String verificationCode) {
                log(verificationCode);
                controller.otp.value = verificationCode;
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'รหัสอ้างอิง: ${controller.ref.value} (${controller.second} วินาที)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF80B7A2),
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: controller.secondActive.value
                  ? () {
                      controller.resentOtp();
                    }
                  : null,
              child: const Text('ขอรหัส OTP อีกครั้ง'),
            ),
            _button(),
          ]),
        )),
      );
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
                    ? () {
                        controller.verifyOtp();
                      }
                    : null,
                child: const Text('ยืนยัน'),
              ),
            )));
  }
}
