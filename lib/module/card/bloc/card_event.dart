
import 'package:equatable/equatable.dart';

import '../../product/data/model/ProductModel.dart';
import '../data/model/card.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final ProductModel item;

  @override
  List<Object> get props => [item];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final ProductModel item;

  @override
  List<Object> get props => [item];
}