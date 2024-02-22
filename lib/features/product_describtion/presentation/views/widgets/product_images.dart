import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(220),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: CachedNetworkImage(imageUrl: widget.imageUrl),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => setState(() {
                  selected = index;
                }),
                child: Container(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenWidth(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected == index
                          ? kPrimaryColor
                          : Colors.transparent,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: CachedNetworkImage(imageUrl: widget.imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
