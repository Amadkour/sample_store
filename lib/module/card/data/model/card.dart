import 'package:equatable/equatable.dart';
import 'package:sample_store/module/product/data/model/ProductModel.dart';

class Cart extends Equatable {
  const Cart({this.items = const <ProductModel>[]});

  final List<ProductModel> items;
///-----------aggregate total payment
  int get totalPrice {
    return items.fold(0, (total, current) => total + (current.price!*current.observedQuantity!));
  }
  @override
  List<Object> get props => [items];
}


