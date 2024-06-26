import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/components/my_button.dart';
import 'package:minimalecommerceapp/models/product.dart';
import 'package:minimalecommerceapp/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove items from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box  to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //yes button
          MaterialButton(
            child: const Text("Yes"),
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              //Remove from cart
              context.read<Shop>().removeFromCart(product);
            },
          ),
        ],
      ),
    );
  }

  //user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: const Color.fromARGB(255, 233, 231, 231),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Cart",
              style: TextStyle(
                // color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get each item in cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          onPressed: () {
                            removeItemFromCart(context, item);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    }),
          ),
          //pay button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
