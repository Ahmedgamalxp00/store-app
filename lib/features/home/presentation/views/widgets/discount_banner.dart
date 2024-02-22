import 'package:flutter/material.dart';
import 'package:store_app/core/utils/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff4a3298),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text.rich(
            TextSpan(
              text: ' A Summer Surprise\n ',
              style: TextStyle(color: Colors.white, height: 1.3),
              children: [
                TextSpan(
                  text: 'Cashback 20%',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
