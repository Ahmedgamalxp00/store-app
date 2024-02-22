import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/views/widgets/cart_listview_item.dart';
import 'package:store_app/features/cart/presentation/views/widgets/empity_cart.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List cartList =
              BlocProvider.of<CartCubit>(context).productMap.keys.toList();
          return cartList.isEmpty
              ? const EmpityCart()
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Dismissible(
                    onDismissed: (direction) {
                      BlocProvider.of<CartCubit>(context)
                          .manageCart(cartList[index]);
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
                    child: CartListViewItem(
                      product: cartList[index],
                      numberOfProduct: BlocProvider.of<CartCubit>(context)
                          .productMap
                          .values
                          .toList()[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: cartList.length,
                );
        },
      ),
    );
  }
}
