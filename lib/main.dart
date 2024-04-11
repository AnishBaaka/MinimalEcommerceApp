
import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/models/shop.dart';
import 'package:minimalecommerceapp/pages/cart_page.dart';
import 'package:minimalecommerceapp/pages/intro_page.dart';
import 'package:minimalecommerceapp/pages/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
