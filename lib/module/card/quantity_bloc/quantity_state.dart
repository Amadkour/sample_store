import 'package:equatable/equatable.dart';

import '../data/model/card.dart';

abstract class QuantityState extends Equatable {
  const QuantityState(this.quantity);
  final int quantity;

}

class QuantityLoaded extends QuantityState {
   const QuantityLoaded({required this.quantity}) : super(quantity);

  @override
  final int quantity;

  @override
  List<Object> get props => [quantity];
}
class QuantityIncreased extends QuantityState {
  const QuantityIncreased({required this.quantity}) : super(quantity);

  @override
  final int quantity;

  @override
  List<Object> get props => [quantity];
}

class QuantityDecrease extends QuantityState {
  const QuantityDecrease({required this.quantity}) : super(quantity);

  @override
  final int quantity;

  @override
  List<Object> get props => [quantity];
}
class QuantityMax extends QuantityState {
  const QuantityMax({required this.quantity}) : super(quantity);

  @override
  final int quantity;

  @override
  List<Object> get props => [quantity];
}
class QuantityMin extends QuantityState {
  const QuantityMin({required this.quantity}) : super(quantity);

  @override
  final int quantity;

  @override
  List<Object> get props => [quantity];
}