import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favorites/presentation/controllers/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

class PopularProductItem2 extends StatelessWidget {
  const PopularProductItem2({super.key, required this.product});
  final ProductModel product;
  final bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        List? storageList = BlocProvider.of<FavoriteCubit>(context)
            .storage
            .read<List>('favorite');

        List favoritesList =
            storageList?.map((e) => ProductModel.fromJson(e)).toList() ?? [];

        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            List cartProduct = BlocProvider.of<CartCubit>(context)
                .productMap
                .entries
                .map((e) => e.key)
                .toList();

            return InkWell(
              onTap: () {
                context.push(AppRouter.kDetailesView, extra: product);
              },
              child: Container(
                width: getProportionateScreenWidth(140),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: favoritesList.any(
                                (element) => element.id == product.id,
                              )
                                  ? const Icon(
                                      Icons.favorite,
                                      color: kPrimaryColor,
                                    )
                                  : const Icon(Icons.favorite_border),
                              onTap: () {
                                BlocProvider.of<FavoriteCubit>(context)
                                    .mangeFavorites(product);
                              },
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<CartCubit>(context)
                                    .manageCart(product);
                              },
                              child: cartProduct.any(
                                (element) => element.id == product.id,
                              )
                                  ? const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                    )
                                  : const Icon(Icons.shopping_cart_outlined),
                            ),
                          ],
                        ),
                        CachedNetworkImage(
                          width: 120,
                          height: 140,
                          imageUrl: product.image as String,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$ ${product.price}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      '${product.rating!.rate}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Gap(5),
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
