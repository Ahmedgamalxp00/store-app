import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/controllers/all_product_cubit/all_product_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/icon_b_with_counter.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        int badgeContent =
            BlocProvider.of<CartCubit>(context).getCartProductNumber();

        return Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 40,
          ),
          color: Colors.white.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F5F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) {
                    BlocProvider.of<AllProductCubit>(context)
                        .addProductToSearchList(searchName: value);
                    print(
                      BlocProvider.of<AllProductCubit>(context)
                          .searchList
                          .toString(),
                    );
                  },
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Search product',
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(13),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              badgeContent == 0
                  ? IconBWithCounter(
                      svgPicture: 'assets/icons/Cart Icon.svg',
                      onTap: () {
                        context.push(AppRouter.kCartView);
                      },
                    )
                  : badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -5, end: -3),
                      badgeStyle:
                          const badges.BadgeStyle(badgeColor: kPrimaryColor),
                      badgeAnimation: const badges.BadgeAnimation.scale(
                        animationDuration: Duration(seconds: 1),
                      ),
                      badgeContent: Text(
                        badgeContent.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      child: IconBWithCounter(
                        svgPicture: 'assets/icons/Cart Icon.svg',
                        onTap: () {
                          context.push(AppRouter.kCartView);
                        },
                      ),
                    ),
              IconBWithCounter(
                svgPicture: 'assets/icons/Bell.svg',
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
