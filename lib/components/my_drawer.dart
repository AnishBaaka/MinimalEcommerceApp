import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //drawer header(logo)
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //shop tile
          MyListTile(
            text: "Shop",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          //cart tile
          MyListTile(
            text: "Cart",
            icon: Icons.shopping_cart,
            onTap: () {
              Navigator.pushNamed(context, '/cart_page');
            },
          ),

          const Spacer(),

          //exit shop tile
          MyListTile(
            text: "Exit",
            icon: Icons.logout,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          ),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
