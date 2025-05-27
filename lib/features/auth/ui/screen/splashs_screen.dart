import 'package:ecommerce/app/app_configs.dart';
import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/auth/ui/screen/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screen/sign_up_screen.dart';
import 'package:ecommerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

import '../widget/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name='/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 3));
  Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
             const Spacer(),
              const AppLogo(),
             const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(height: 16,),
               Text('${context.localization.version} ${AppConfigs.currentAppVersion}'),
            ],
          ),
        ),
      ),
    );
  }
}


