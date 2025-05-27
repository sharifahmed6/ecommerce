import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/core/widget/show_snack_bar_message.dart';
import 'package:ecommerce/features/auth/data/sign_up_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/screen/verify_otp_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController =
      TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.find<SignUpController>();
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

  Form _buildForm(TextTheme textTheme) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 32),
          const AppLogo(),
          SizedBox(height: 24),
          Text(
            context.localization.registerYourAccount,
            style: textTheme.titleLarge,
          ),
          SizedBox(height: 8),
          Text(
            context.localization.getStartedWithYourDetails,
            style: textTheme.titleSmall,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: context.localization.email),
            validator: (String? value) {
              String email = value ?? '';
              if (!EmailValidator.validate(email)) {
                return 'Please Enter Your Email';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localization.firstName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please Enter Your First Name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localization.lastName,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please Enter Your Last Name';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: context.localization.mobile),
            validator: (String? value) {
              String phoneNumber = value ?? '';
              RegExp regExp = RegExp(
                r"(^(\+8801|8801|01|008801))[1|3-9]{1}(\d){8}$",
              );
              if (regExp.hasMatch(phoneNumber) == false) {
                return 'Please Enter Your Valid Phone Number';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _cityTEController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: context.localization.city),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please Enter Your City';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: context.localization.password,
            ),
            validator: (String? value) {
              if ((value?.trim().isEmpty ?? true) || value!.length < 6) {
                return 'Please Enter A Password More Than 6 Letters';
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              hintText: context.localization.deliveryAddress,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please Enter Your Delivery Address';
              }
              return null;
            },
          ),

          SizedBox(height: 8),
          GetBuilder<SignUpController>(
            builder: (controller) {
              return Visibility(
                visible: controller.signUpInProgress == false,
                replacement: CircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: _onTapSignUpButton,
                  child: Text(context.localization.signUp),
                ),
              );
            },
          ),
          SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: context.localization.doNotHaveAnAccount,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: context.localization.signIn,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.themeColor,
                  ),
                  recognizer:
                      TapGestureRecognizer()..onTap = _onTapSignInButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        phone: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
        password: _passwordTEController.text,
      );
      final bool isSuccess = await signUpController.signUp(signUpModel);
      if (isSuccess) {
        Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text);
      } else {
        showSnackBarMessage(context, signUpController.errorMessage!,true);
      }
    }
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _mobileTEController.dispose();
    _deliveryAddressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
