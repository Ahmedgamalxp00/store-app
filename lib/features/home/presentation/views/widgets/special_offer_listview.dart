import 'package:flutter/material.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/home/presentation/views/widgets/special_offer_card.dart';

class SpecialOfferListView extends StatelessWidget {
  const SpecialOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(100),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 3,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const SpecialOfferCard(
            category: 'Smart phone',
            image: 'assets/images/Image Banner 2.png',
            numOfbrand: 18,
          );
        },
      ),
    );
  }
}
