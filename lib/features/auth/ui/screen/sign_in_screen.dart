import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/auth/ui/screen/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 32),
                const AppLogo(),
                SizedBox(height: 24),
                Text(
                  context.localization.welcomeBack,
                  style: textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  context.localization.enterYourEmailPassword,
                  style: textTheme.titleSmall,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(context.localization.signIn),
                ),
                SizedBox(height: 24,),
                RichText(
                    text: TextSpan(
                      text: context.localization.doNotHaveAnAccount,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                      ),
                      children: [
                      TextSpan(
                        text: context.localization.signUp,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor
                        ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                      ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignUpButton(){
  Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
