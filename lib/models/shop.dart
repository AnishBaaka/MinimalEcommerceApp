import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: "Hoodie",
        price: 100,
        description:
            "A cozy hoodie with a drawstring hood and front pocket, perfect for casual wear.",
        imagePath: 'assets/images/hoodie.png'),
    //product 2
    Product(
        name: "Pant",
        price: 40,
        description:
            "Comfortable pants in various styles, such as jeans, chinos, or joggers, suitable for casual or semi-formal occasions",
        imagePath: 'assets/images/pant.png'),
    //product 3
    Product(
        name: "Shoe",
        price: 200,
        description:
            "Stylish shoes available in different types like sneakers, boots, or loafers, suitable for various occasions.",
        imagePath: 'assets/images/shoe.png'),
    //product 4
    Product(
        name: "Trouser",
        price: 30,
        description:
            "Classic trousers in different cuts and materials, ideal for formal or professional settings.",
        imagePath: 'assets/images/trouser.png'),
    //product 5
    Product(
        name: "Watch",
        price: 500,
        description: "Sleek wristwatch, perfect for keeping time with style.",
        imagePath: 'assets/images/watch.png'),
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
