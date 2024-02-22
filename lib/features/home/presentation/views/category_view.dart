import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/category_product_listview.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const CategoryProducListView(),
    );
  }
}
