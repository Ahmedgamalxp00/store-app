import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

class PopularProductItem extends StatelessWidget {
  const PopularProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kDetailesView, extra: product);
      },
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: getProportionateScreenWidth(140),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 1.02,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CachedNetworkImage(
                    imageUrl: product.image as String,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              '${product.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${product.price} \$',
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(30),
                  height: getProportionateScreenHeight(30),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
