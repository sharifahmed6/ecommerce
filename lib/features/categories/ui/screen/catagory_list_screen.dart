import 'package:ecommerce/features/common/ui/widget/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/controller/main_bottom_nav_bar_controller.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FittedBox(child: CategoriesItem());
            },
          ),
        ),
      ),
    );
  }
}
