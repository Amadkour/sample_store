import 'package:equatable/equatable.dart';
import '../data/model/ProfileModel.dart';
abstract class ProfileState extends Equatable {
  @override
  List<dynamic> get props => [];
}

class ProfileLoadingState extends ProfileState {

}

class ProfileSuccessState extends ProfileState {

  final ProfileModel profileModel;

  ProfileSuccessState({required this.profileModel});
@override
  // TODO: implement props
  List get props => super.props;
}

class ProfileFailState extends ProfileState {

  final String message;

  ProfileFailState({required this.message});

  @override
  List<String> get props => [message];
}
