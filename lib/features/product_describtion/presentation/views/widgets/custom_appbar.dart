import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/home/presentation/views/widgets/rounded_btn.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.ratting});
  final double ratting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 40,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedBTN(
            icon: Icons.arrow_back_ios_rounded,
            ontap: () {
              context.pop();
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$ratting',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Gap(5),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
