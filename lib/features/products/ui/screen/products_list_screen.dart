import 'package:ecommerce/features/common/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, required this.category});
  final String category;
  static const String name = '/products';
  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
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
