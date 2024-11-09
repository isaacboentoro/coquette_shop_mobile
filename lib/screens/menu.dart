import 'package:flutter/material.dart';
import 'package:coquette_shop_mobile/widgets/left_drawer.dart';
import 'package:coquette_shop_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306256362'; 
  final String name = 'Isaac Jesse Boentoro'; 
  final String className = 'PBD KKI'; 
  final List<ItemHomepage> items = [
    ItemHomepage("View Product List", Icons.menu, const Color(0xFF8ec07c)),
    ItemHomepage("Add Product", Icons.add, const Color(0xFFd79921)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFcc241d)),
  ];
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'coquette-shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Welcome to coquette-shop',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

