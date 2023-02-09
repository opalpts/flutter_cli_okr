import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'register_controller.dart';

import '../../../body_widget.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundWidget(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: ClipOval(
                            child: Image.network(
                          "https://cdn.discordapp.com/attachments/1006820126168993893/1054661100945281044/avatar-user.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ))),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text('ลงทะเบียนเข้าใช้งาน',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ),
                    const Text('เบอร์โทรศัพท์*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: controller.moblie,
                      decoration: const InputDecoration(
                        hintText: "เบอร์โทรศัพท์",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('ชื่อ*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: controller.firstname,
                      decoration: const InputDecoration(
                        hintText: "กรุณากรอกชื่อ",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('นามสกุล*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: controller.lastname,
                      decoration: const InputDecoration(
                        hintText: "กรุณากรอกนามสกุล",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('อีเมล*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: controller.lastname,
                      decoration: const InputDecoration(
                        hintText: "กรุณากรอกอีเมล (abc@test.com)",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 3, color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('วันเกิด*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            // showTitleActions: true,
                            // minTime: DateTime(2018, 3, 5),
                            // maxTime: DateTime(2019, 6, 7),
                            theme: const DatePickerTheme(
                                headerColor: Colors.white,
                                backgroundColor: Colors.white,
                                itemStyle: TextStyle(
                                    color: Color(0xFF80B7A2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                doneStyle: TextStyle(
                                    color: Color(0xFF80B7A2),
                                    fontSize: 16)), onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.th);
                      },
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    _button()
                  ])),
        ));
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
                onPressed: () {},
                child: const Text('ยืนยัน'),
              ),
            )));
  }
}
