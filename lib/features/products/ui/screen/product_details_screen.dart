import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/extension_localization.dart';
import 'package:ecommerce/features/products/ui/widget/color_picker.dart';
import 'package:ecommerce/features/products/ui/widget/increment_decrement_counter_widget.dart';
import 'package:ecommerce/features/products/ui/widget/product_image_carousel_slider.dart';
import 'package:ecommerce/features/products/ui/widget/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product_details';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.productDetails)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselSlider(),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    'Ramadan T-Shirt 50% Off',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star),
                                          Text('4.2'),
                                        ],
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Reviews')),
                                      Card(
                                        color: AppColors.themeColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IncrementDecrementCounterWidget(
                              onChange: (value) {
                                print(value);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ColorPicker(colors: ['Black','Red','White','Yellow'],
                            onChange: (selectedColor){
                            print(selectedColor);
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        SizePicker(sizes: ['S','M','L','X','XL'],
                            onChange: (selectedColor){
                          print(selectedColor);
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        const  Text('Description',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                        ),),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                          style: TextStyle(
                            color: Colors.grey,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCardSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCardSection() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price'),
                  Text('\$1000',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor
                  ),)
                ],
              ),
              SizedBox(
                width: 140,
                  child: ElevatedButton(onPressed: (){}, child: Text('Add To Cart'))
              ),
            ],
          ),
        );
  }
}
