import 'package:ecommerce/features/products/ui/screen/products_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductsListScreen.name,arguments: 'Electronics');
      },
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.computer,
                size: 48,
                color: AppColors.themeColor,
              ),
            ),
          ),
          Text('Computers',style: TextStyle(
              fontSize: 16,
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}