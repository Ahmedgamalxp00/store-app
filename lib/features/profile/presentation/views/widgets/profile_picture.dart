import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    String pictureUrl = BlocProvider.of<SigninCubit>(context).pictureUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: kSecondaryColor.withOpacity(0.1),
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: pictureUrl,
                errorWidget: (context, url, error) => const Icon(
                  Icons.person_2_outlined,
                  color: kPrimaryColor,
                  size: 50,
                ),
                placeholder: (context, url) => const Icon(
                  Icons.person_2_outlined,
                  color: kPrimaryColor,
                  size: 50,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: -10,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  color: const Color(0xffE8EBE8),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: kTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
