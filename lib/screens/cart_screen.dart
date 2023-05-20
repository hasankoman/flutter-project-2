import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cartItems[index];
                return Dismissible(
                  key: Key(cartItem.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    cartProvider.removeItem(cartItem.id);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(cartItem.product.imageUrl),
                    ),
                    title: Text(cartItem.product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${cartItem.product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: QuantityController(
                      quantity: cartItem.quantity,
                      onIncrease: () {
                        cartProvider.addItem(cartItem.product);
                      },
                      onDecrease: () {
                        cartProvider.decreaseItemQuantity(cartItem.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Total',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Order Placed'),
                    content: Text('Your order has been successfully placed!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          cartProvider.clearCart();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Order'),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class QuantityController extends StatelessWidget {
  final int quantity;
  final Function() onIncrease;
  final Function() onDecrease;

  QuantityController({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onDecrease,
          ),
          Text(quantity.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
