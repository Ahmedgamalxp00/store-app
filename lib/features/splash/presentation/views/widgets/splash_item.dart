import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';

class SplashItem extends StatelessWidget {
  const SplashItem({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(
          'MARKETO',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          width: getProportionateScreenWidth(265),
          height: getProportionateScreenHeight(235),
        ),
      ],
    );
  }
}
