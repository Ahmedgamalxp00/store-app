import 'package:flutter/material.dart';
import 'package:store_app/core/utils/bottom_navbar_lists.dart';
import 'package:store_app/core/utils/size_config.dart';

import 'package:store_app/features/profile/presentation/views/widgets/custom_bottom_navbar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int curruntIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBody: true,
      body: screens[curruntIndex],
      bottomNavigationBar: CustomBottmNavBar(
        onTabChange: (index) {
          setState(() {
            curruntIndex = index;
          });
        },
      ),
    );
    //  );
  }
}
