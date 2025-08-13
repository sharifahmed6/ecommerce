import 'package:ecommerce/features/common/data/models/product_model.dart';

class CartListModel{
  final ProductModel productModel;
  final String? size;
  final String? color;
  final int quantity;

  CartListModel({required this.productModel, required this.size, required this.color, required this.quantity});
factory CartListModel.fromJson(Map<String,dynamic> jsonData){
  return CartListModel(
      productModel: ProductModel.fromJson(jsonData['product']),
      size: jsonData['size'],
      color: jsonData['color'],
      quantity: jsonData['quantity']
  );
}
}