import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/controllers/category_cubit/category_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/popular_product_item2.dart';

class CategoryProducListView extends StatelessWidget {
  const CategoryProducListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            physics: const BouncingScrollPhysics(),
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
        } else if (state is CategoryFailure) {
          return Center(
            child: Text(state.erorrMassage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
