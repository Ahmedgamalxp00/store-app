import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/widgets/custom_botton.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        List cartProduct = BlocProvider.of<CartCubit>(context)
            .productMap
            .entries
            .map((e) => e.key)
            .toList();
        return Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: CustomBotton(
                  text: cartProduct.any(
                    (element) => element.id == product.id,
                  )
                      ? 'Remove from cart'
                      : 'Add to cart',
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).manageCart(product);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
