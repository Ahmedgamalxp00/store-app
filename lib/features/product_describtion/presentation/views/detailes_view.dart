import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/product_describtion/presentation/views/widgets/addtocart_section.dart';
import 'package:store_app/features/product_describtion/presentation/views/widgets/color_section.dart';
import 'package:store_app/features/product_describtion/presentation/views/widgets/custom_appbar.dart';
import 'package:store_app/features/product_describtion/presentation/views/widgets/describtion_section.dart';
import 'package:store_app/features/product_describtion/presentation/views/widgets/product_images.dart';

class DetailesView extends StatelessWidget {
  const DetailesView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      body: Column(
        children: [
          CustomAppBar(ratting: product.rating!.rate as double),
          ProductImages(imageUrl: product.image as String),
          DescribtionSection(
            product: product,
          ),
          const ColorSection(),
          AddToCartSection(product: product),
        ],
      ),
    );
  }
}
