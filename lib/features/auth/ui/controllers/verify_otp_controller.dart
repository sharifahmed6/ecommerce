import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network_caller/network_caller.dart';
import 'package:ecommerce/features/auth/data/verify_otp_model.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get verifyOtpIProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future<bool> verifyOtp(VerifyOtpModel verifyOtpModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.verifyOtpUrl, body: verifyOtpModel.toJson());
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
