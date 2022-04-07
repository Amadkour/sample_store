
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProfileEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchProfile extends ProfileEvent{}
