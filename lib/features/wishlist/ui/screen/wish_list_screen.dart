import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/common/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.wishList)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 16,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductCard());
          },
        ),
      ),
    );
  }
}
