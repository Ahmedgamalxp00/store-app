import 'package:flutter/material.dart';
import 'package:store_app/features/cart/presentation/views/widgets/cart_listview.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartListView(),
      ],
    );
  }
}
