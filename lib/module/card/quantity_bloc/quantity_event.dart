import 'package:equatable/equatable.dart';

abstract class QuantityEvent extends Equatable {
  const QuantityEvent();

  @override
  List<Object> get props => [];
}

class IncreaseQuantity extends QuantityEvent {
  final int quantityIndex;

  const IncreaseQuantity(this.quantityIndex);

  @override
  List<Object> get props => [quantityIndex];

  @override
  String toString() => quantityIndex.toString();
}

class LoadQuantity extends QuantityEvent {
  final int quantityIndex;

  const LoadQuantity(this.quantityIndex);

  @override
  List<Object> get props => [quantityIndex];

  @override
  String toString() => quantityIndex.toString();
}

class DecreaseQuantity extends QuantityEvent {
  final int quantityIndex;

  const DecreaseQuantity(this.quantityIndex);

  @override
  List<Object> get props => [quantityIndex];

  @override
  String toString() => quantityIndex.toString();
}
