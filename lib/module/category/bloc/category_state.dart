import 'package:equatable/equatable.dart';
import '../data/model/CategoryModel.dart';
abstract class CategoryState extends Equatable {
  @override
  List<dynamic> get props => [];
}

class CategoryLoadingState extends CategoryState {

}

class CategorySuccessState extends CategoryState {

  final List<CategoryModel> categoryModels;

  CategorySuccessState({required this.categoryModels});

  @override
  // TODO: implement props
  List<CategoryModel> get props => categoryModels;
}

class CategoryFailState extends CategoryState {

  final String message;

  CategoryFailState({required this.message});

  @override
  List<String> get props => [message];
}
