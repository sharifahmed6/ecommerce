import 'dart:async';

import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/auth/data/verify_otp_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:ecommerce/features/auth/ui/screen/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/widget/show_snack_bar_message.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;
  static const String name = '/verify_otp_screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpController verifyOtpController =
      Get.find<VerifyOtpController>();

  final RxInt _currentTime= 30.obs;

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_currentTime.value == 0) {
        timer.cancel();
      } else {
        _currentTime.value = _currentTime.value - 1;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          const AppLogo(),
          SizedBox(height: 24),
          Text(
            context.localization.enterYourOtpCode,
            style: textTheme.titleLarge,
          ),
          SizedBox(height: 8),
          Text(
            context.localization.a4DigitOtpCodeHasBeenSent,
            style: textTheme.titleSmall,
          ),
          SizedBox(height: 16),
          PinCodeTextField(
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              activeFillColor: Colors.white,
            ),
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            controller: _otpTEController,
            appContext: context,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onTapVerifyButton,
            child: Text(context.localization.verify),
          ),
          SizedBox(height: 24),
          Obx(() {
            return Column(
              children: [
                Visibility(
                  visible: _currentTime.value == 0,
                  child: TextButton(
                    onPressed: () {
                      _startTimer();
                    },
                    child: const Text('Resend Otp'),
                  ),
                ),
                Visibility(
                  visible: _currentTime.value != 0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Resend Otp in ${_currentTime.value}'),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  void _onTapVerifyButton() {
    _verifyOtp();
  }

  Future<void> _verifyOtp() async {
    VerifyOtpModel verifyOtpModel = VerifyOtpModel(
      email: widget.email,
      otp: _otpTEController.text,
    );
    final bool isSuccess = await verifyOtpController.verifyOtp(verifyOtpModel);
    if (isSuccess) {
      showSnackBarMessage(context, 'Otp has been verified! Please login');
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, verifyOtpController.errorMessage!, true);
    }
  }
}
