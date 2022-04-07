import 'package:bloc/bloc.dart';
import 'package:sample_store/module/login/data/authentication_Api.dart';
import '../data/model/ProfileModel.dart';
import 'profile_event.dart';
import 'profile_state.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthenticationRepository? profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileLoadingState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfile) {
      yield ProfileLoadingState();
      try {
       ProfileModel profileModel = await profileRepository!.getProfile();
        yield ProfileSuccessState( profileModel: profileModel);
      } catch (e) {
        yield ProfileFailState(message: e.toString());
      }
    }
  }
}