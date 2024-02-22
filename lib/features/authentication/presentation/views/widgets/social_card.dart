import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({super.key, required this.image, this.ontap});
  final String image;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
