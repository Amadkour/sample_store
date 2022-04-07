
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CategoryEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchCategories extends CategoryEvent{}
