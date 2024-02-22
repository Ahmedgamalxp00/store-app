
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/presentation/views/widgets/rounded_btn.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.product,
    required this.numberOfProduct,
  });

  final ProductModel product;
  final int numberOfProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: .88,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CachedNetworkImage(
                  imageUrl: product.image as String,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' \$${product.price}  ',
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'x$numberOfProduct',
                          style: const TextStyle(color: kTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              RoundedBTN(
                width: 30,
                height: 30,
                color: kSecondaryColor.withOpacity(0.2),
                icon: Icons.add,
                ontap: () {
                  BlocProvider.of<CartCubit>(context).addProductToCart(product);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '$numberOfProduct',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              RoundedBTN(
                width: 30,
                height: 30,
                color: kSecondaryColor.withOpacity(0.2),
                icon: Icons.remove,
                ontap: () {
                  if (numberOfProduct > 1) {
                    BlocProvider.of<CartCubit>(context)
                        .removeProductFromCart(product);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
