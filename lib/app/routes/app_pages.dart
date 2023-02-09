import 'package:get/get.dart';

import '../modules/consent/consent_binding.dart';
import '../modules/consent/consent_view.dart';
import '../modules/otp/otp_binding.dart';
import '../modules/otp/otp_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/verify/verify_binding.dart';
import '../modules/verify/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CONSENT;

  static final routes = [
    GetPage(
      name: _Paths.CONSENT,
      page: () => const ConsentView(),
      binding: ConsentBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
  ];
}
