import 'package:flutter/material.dart';
import 'package:store_app/core/utils/size_config.dart';

class SectionTiTle extends StatelessWidget {
  const SectionTiTle({super.key, required this.title, this.ontap});
  final String title;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              'See More',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
