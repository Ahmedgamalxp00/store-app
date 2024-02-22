import 'package:flutter/material.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/favorites_listview.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        automaticallyImplyLeading: false,
      ),
      body: const FavoriteListView(),
    );
  }
}
