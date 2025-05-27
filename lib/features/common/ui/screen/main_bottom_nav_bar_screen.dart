import 'package:ecommerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce/features/home/ui/screen/home_screen.dart';
import 'package:ecommerce/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../categories/ui/screen/catagory_list_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name='/main_nav_bar_screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {

  final List<Widget> _screen=[
    const HomeScreen(),
    const CategoryListScreen(),
    const HomeScreen(),
    const WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screen[controller.SelectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
            selectedIndex: controller.SelectedIndex,
              onDestinationSelected: controller.changeIndex,
              destinations:const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
              ]
          );
        }
      ),
    );
  }
}
