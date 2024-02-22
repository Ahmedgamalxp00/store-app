import 'package:flutter/material.dart';
import 'package:store_app/core/utils/size_config.dart';

class RoundedBTN extends StatelessWidget {
  const RoundedBTN({
    super.key,
    this.ontap,
    required this.icon,
    this.color = Colors.white,
    this.width = 40,
    this.height = 40,
  });
  final void Function()? ontap;
  final IconData icon;
  final Color color;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenWidth(height),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon),
      ),
    );
  }
}
