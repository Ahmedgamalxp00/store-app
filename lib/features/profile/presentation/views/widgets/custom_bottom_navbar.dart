import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:store_app/core/constants.dart';

class CustomBottmNavBar extends StatelessWidget {
  const CustomBottmNavBar({
    super.key,
    this.onTabChange,
  });
  final Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
            tabBackgroundColor: kPrimaryColor.withOpacity(0.2),
            color: kTextColor,
            activeColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gap: 10,
            onTabChange: onTabChange,
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
