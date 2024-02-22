import 'package:flutter/material.dart';
import 'package:store_app/features/cart/presentation/views/widgets/bottom_bar.dart';
import 'package:store_app/features/cart/presentation/views/widgets/cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              '   (4 Item)',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: const CartBody(),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const BottonBar(),
      ),
    );
  }
}
