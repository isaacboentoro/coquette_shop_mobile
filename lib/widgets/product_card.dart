import 'package:flutter/material.dart';
import 'package:coquette_shop_mobile/screens/product_form.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:coquette_shop_mobile/screens/login.dart';
import 'package:coquette_shop_mobile/screens/list_product.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Add this line

  ItemHomepage(this.name, this.icon, this.color); // Update constructor
}

class ItemCard extends StatelessWidget {
  // Display the card with an icon and name.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Specify the background color of the application theme.
      color: Theme.of(context).colorScheme.secondary,
      // Round the card border.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Touch-responsive area
        onTap: () async {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }

          if (item.name == "View Product List") {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const ProductPage()),
              );
          }

          else if (item.name == "Logout") {
            final response = await request.logout("http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Goodbye, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(message),
                      ),
                  );
                }
            }
          }
        },

        // Container to store the Icon and Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Place the Icon and Text in the center of the card.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}