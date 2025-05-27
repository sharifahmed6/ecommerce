import 'package:ecommerce/features/auth/ui/screen/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screen/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screen/splashs_screen.dart';
import 'package:ecommerce/features/auth/ui/screen/verify_otp_screen.dart';
import 'package:ecommerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:ecommerce/features/products/ui/screen/product_details_screen.dart';
import 'package:ecommerce/features/products/ui/screen/products_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
   late Widget route;
    if(settings.name == SplashScreen.name){
     route= const SplashScreen();
    } else if(settings.name == SignInScreen.name){
      route = const SignInScreen();
    } else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    } else if(settings.name == VerifyOtpScreen.name){
      String email = settings.arguments as String;
      route = VerifyOtpScreen(email:email );
    }else if(settings.name == MainBottomNavBarScreen.name){
      route = const MainBottomNavBarScreen();
    }else if(settings.name == ProductsListScreen.name){
      String category = settings.arguments as String;
      route =  ProductsListScreen(category: category);
    }else if(settings.name == ProductDetailsScreen.name){
      route =  ProductDetailsScreen();
    }
   return MaterialPageRoute(builder: (context){
     return route;
   });
  }
}