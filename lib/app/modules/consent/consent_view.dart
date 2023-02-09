import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'consent_controller.dart';

import '../../../body_widget.dart';

class ConsentView extends GetView<ConsentController> {
  const ConsentView({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                          'เงื่อนไขกิจกรรมและ\nนโยบายความเป็นส่วนตัว',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: const SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              "1. เมื่อคุณสร้างบัญชีหรือโปรไฟล์กับเรา เราอาจขอทราบข้อมูล เช่น ชื่อ วันเดือนปีเกิด หรือที่อยู่อีเมล\n2. หากคุณสั่งซื้อผลิตภัณฑ์หรือบริการที่ต้องชำระเงินจากเรา เราอาจขอทราบชื่อ ที่อยู่ ข้อมูลติดต่อ และข้อมูลในการจัดส่งและชำระเงินของคุณเพื่อที่จะดำเนินการกับคำสั่งซื้อของคุณ\n3. เมื่อคุณติดต่อศูนย์บริการ เราอาจขอข้อมูลเพื่อยืนยันตัวตนของคุณและผลิตภัณฑ์ที่คุณสอบถามเพื่อจะได้ตอบกลับได้อย่างถูกต้องเมื่อคุณติดต่อเจ้าหน้าที่ของศูนย์บริการหรือเจ้าหน้าที่อื่นๆ ของเรา การสนทนาจะได้รับการบันทึกในระบบ\n4. หากคุณเลือกแชร์ข้อมูลติดต่อ เราจะเก็บรวบรวมหมายเลขโทรศัพท์และข้อมูลติดต่ออื่นๆ เพื่ออำนวยความสะดวกในการแชร์ไฟล์และส่งข้อความ คุณสามารถปิดหรือจำกัดคุณสมบัติเหล่านี้ได้ในการตั้งค่าบนอุปกรณ์ของคุณ\n5. ข้อมูลอุปกรณ์: รุ่นฮาร์ดแวร์ของคุณ, ข้อมูลฮาร์ดแวร์ของอุปกรณ์, หมายเลข IMEI และรหัสประจำอุปกรณ์อื่นๆ, หมายเลขโทรศัพท์, หมายเลขซีเรียล, รหัสการขาย, บันทึกการเข้าใช้, เวอร์ชันซอฟต์แวร์ปัจจุบัน, MCC (รหัสประเทศมือถือ), MNC (รหัสเครือข่ายมือถือ), ที่อยู่ MAC, ที่อยู่ IP, Android Advertising ID, คุกกี้, พิกเซล, ข้อมูลการสมัครสมาชิก, เวอร์ชันระบบปฏิบัติการ และการตั้งค่าอุปกรณ์ที่คุณใช้เข้าถึงบริการ\n6. ข้อมูลรายการบันทึก: ข้อมูลเกี่ยวกับการวิเคราะห์ ข้อมูลทางเทคนิค ข้อผิดพลาด และข้อมูลการใช้งาน เช่น เวลาและระยะเวลาที่คุณใช้บริการ คำที่ใช้ค้นหาที่คุณป้อนลงในอุปกรณ์ซึ่งเกี่ยวข้องกับบริการของ Samsung และข้อมูลใด ๆ ที่มีการจัดเก็บไว้ในคุกกี้ที่เราตั้งค่าไว้บนอุปกรณ์ของคุณ\nข้อมูลตำแหน่ง: สัญญาณ GPS ของอุปกรณ์ของคุณหรือข้อมูลเกี่ยวกับจุดเชื่อมต่อ Wi-Fi ที่อยู่ใกล้ ๆ และเสาสัญญาณของระบบที่อาจมีการส่งข้อมูลมาให้เราเมื่อคุณใช้บริการบางอย่างและเปิดใช้งานคุณสมบัติตำแหน่งที่ตั้ง",
                              style: TextStyle(fontSize: 16))),
                    ),
                    CheckboxListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: const Text(
                            'ฉันได้อ่านและยอมรับนโยบายการรักษาความเป็นส่วนตัว'),
                        value: controller.term.value,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: const Color(0xFF80B7A2),
                        checkColor: Colors.black,
                        onChanged: (newBool) {
                          controller.checkButtonTerm(newBool);
                        }),
                    CheckboxListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: const Text(
                            'ฉันต้องการรับสิทธิพิเศษและโปรโมชั่นร่วมถึงข่าวสารจากบริษัทและพันธมิตรตามที่ระบุไว้ในนโยบายความเป็นส่วนตัว'),
                        value: controller.condition.value,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: const Color(0xFF80B7A2),
                        checkColor: Colors.black,
                        onChanged: (newBool) {
                          controller.checkButtonCon(newBool);
                        }),
                    _button(context),
                  ]))));
    });
  }

  Widget _button(BuildContext context) {
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
                        Get.toNamed("/otp");
                      }
                    : null,
                child: const Text('ยอมรับ'),
              ),
            )));
  }
}
