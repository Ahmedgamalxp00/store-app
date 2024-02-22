import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/favorites/presentation/controllers/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

class DescribtionSection extends StatelessWidget {
  const DescribtionSection({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        List? storageList = BlocProvider.of<FavoriteCubit>(context)
            .storage
            .read<List>('favorite');
        List favoritesList =
            storageList?.map((e) => ProductModel.fromJson(e)).toList() ?? [];
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    product.title as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Gap(10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(15),
                        topStart: Radius.circular(15),
                      ),
                    ),
                    child: GestureDetector(
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
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    product.description as String,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(height: 1.5),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See More detailes >',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
