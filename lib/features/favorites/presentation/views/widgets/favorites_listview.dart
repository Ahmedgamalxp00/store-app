import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:store_app/features/favorites/presentation/controllers/cubit/favorite_cubit.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/favorites_listview_item.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> favoriteList =
        BlocProvider.of<FavoriteCubit>(context).storedList;
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, bottom: 100),
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                BlocProvider.of<FavoriteCubit>(context).mangeFavorites(
                  favoriteList[index],
                );
              },
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffe6e6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/Trash.svg',
                        width: 20,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              child: FavoritesListviewItem(
                product: favoriteList[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: favoriteList.length,
        );
      },
    );
  }
}
