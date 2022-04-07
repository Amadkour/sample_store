import 'package:equatable/equatable.dart';

import '../data/model/ProductModel.dart';

abstract class ProductState extends Equatable {
  @override
  List<dynamic> get props => [];
}

class ProductLoadingState extends ProductState {

}

class ProductSuccessState extends ProductState {

  final List<ProductModel> productModels;

  ProductSuccessState({required this.productModels});

  @override
  // TODO: implement props
  List<ProductModel> get props => productModels;
}

class ProductFailState extends ProductState {

  final String message;

  ProductFailState({required this.message});

  @override
  List<String> get props => [message];
}
