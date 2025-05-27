import 'package:ecommerce/features/products/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.showPng),
                    fit: BoxFit.scaleDown,
                  ),
                  color: AppColors.themeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Nike Nk76- New Collection",
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "100৳",
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.orange,
                            ),
                            Text('3.3'),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}