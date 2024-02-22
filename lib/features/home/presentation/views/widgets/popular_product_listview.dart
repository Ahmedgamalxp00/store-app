import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/controllers/all_product_cubit/all_product_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/popular_product_item2.dart';

class PopularProductsListview extends StatelessWidget {
  const PopularProductsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        if (state is AllProductSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return PopularProductItem2(
                product: state.products[index],
              );
            },
            itemCount: state.products.length,
          );
        } else if (state is AllProductFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Center(
              child: Text(state.erorrMassage),
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 70),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
