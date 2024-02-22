import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/profile/presentation/views/widgets/profile_list.dart';
import 'package:store_app/features/profile/presentation/views/widgets/profile_picture.dart';
import 'package:store_app/features/profile/presentation/views/widgets/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit()..onInit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicture(),
            UserInfo(),
            ProfileList(),
          ],
        ),
        // bottomNavigationBar:  CustomBottmNavBar(onTabChange: (index){},),
      ),
    );
  }
}
