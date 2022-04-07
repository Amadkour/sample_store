import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/thems/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/string.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileFailState) {
        return Text(state.message);
      } else if (state is ProfileLoadingState) {
        ///-------------loading
        return loading();
      } else if (state is ProfileSuccessState) {
        ///--------------loading product Successfully
        return profileListDesign(state);
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    }));
  }

  Widget profileListDesign(ProfileSuccessState state) => Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ' + state.profileModel.id.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),

            Text(
              'Name: ' + state.profileModel.name.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(
              'Email: ' + state.profileModel.email.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(

                    color: AppColors.primaryColor,
                    border: Border.all(color: AppColors.iconColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () async {
                    (await SharedPreferences.getInstance()).remove(AppString.token);
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                   'Logout',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget loading() => Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ));
}
