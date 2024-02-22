import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/profile/presentation/views/widgets/profile_list_item.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ProfileListItem(
            title: 'My Account',
            iconPass: 'assets/icons/User Icon.svg',
            ontap: () {},
          ),
          ProfileListItem(
            title: 'Notifications',
            iconPass: 'assets/icons/Bell.svg',
            ontap: () {},
          ),
          ProfileListItem(
            title: 'Settings',
            iconPass: 'assets/icons/Settings.svg',
            ontap: () {},
          ),
          // ProfileListItem(
          //   title: 'Help Center',
          //   iconPass: 'assets/icons/Question mark.svg',
          //   ontap: () {},
          // ),
          ProfileListItem(
            title: 'Log Out',
            iconPass: 'assets/icons/logout-svgrepo-com.svg',
            ontap: () async {
              await FirebaseAuth.instance.signOut();
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FacebookAuth.instance.logOut();
              context.go(AppRouter.kSignIn);
            },
          ),
        ],
      ),
    );
  }
}
