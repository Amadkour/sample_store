
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchProducts extends ProductEvent{
  final int? categoryId;
  FetchProducts({this.categoryId});
}
