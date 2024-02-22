import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:store_app/core/constants.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.title,
    required this.iconPass,
    this.ontap,
  });
  final String title;
  final String iconPass;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: ontap,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kSecondaryColor.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SvgPicture.asset(
                    iconPass,
                    color: kPrimaryColor,
                    width: 25,
                    height: 25,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: kTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
