
import 'dart:async';
import 'package:sample_store/module/card/data/model/card.dart';

import '../../../product/data/model/ProductModel.dart';

class CartRepository  {
   List<ProductModel> items = <ProductModel>[];
  static const _delay = Duration(milliseconds: 2000);
  Future<List<ProductModel>> loadCartItems() => Future.delayed(_delay, () => items);

  void addItemToCart(ProductModel item) => items.add(item);

  void removeItemFromCart(ProductModel item) => items.remove(item);

}