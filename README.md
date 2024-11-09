<details>
<Summary><b>Assignment 7</b></Summary>

# How I implemented the [assignment checklist](https://pbp-fasilkom-ui.github.io/ganjil-2025/en/assignments/individual/assignment-7)

First, I created a new flutter project:
```
flutter create coquette_shop_mobile
```

Then, moved `MyHomePage` and the preceding classes from `main.dart` to a new file `menu.dart`.

To add the buttons and change their colors:

`menu.dart`
```dart
  final List<ItemHomepage> items = [
    ItemHomepage("View Product List", Icons.menu, Color(0xFF8ec07c)),
    ItemHomepage("Add Product", Icons.add, Color(0xFFd79921)),
    ItemHomepage("Logout", Icons.logout, Color(0xFFcc241d)),
  ];
```

# Assignment questions

### Stateless vs Stateful widgets 
Stateless widgets are immutable, meaning that their properties can't change once created. Stateful widgets can update depending on its current "state". 

### Widgets used for this project
The widgets used here are all Stateless. This is because everything so far is static content, which means we don't have to use Stateful widgets.

### Use for `setState()`

`setState()` is used to modify any variable that is part of the state of a StatefulWidget. 

### `const` vs `final`

`const` variables are variables which value is known at compile time, and are immutable. 

`final` variables are run-time constants. Once its value is set, it cannot be changed, but it does not need to be known at compile time. 

</details>
<details>
<Summary><b>Assignment 8</b></Summary>

# How I implemented the [assignment checklist](https://pbp-fasilkom-ui.github.io/ganjil-2025/en/assignments/individual/assignment-8)


Creating the form page: 
`product_form.dart`

First, I initialized a class `ProductFormPage` to be called later that is a StateFulWidget with `_ProductFormPageState` as its state:

```dart
import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
```

then gave it the data fields previously used in the Django project:
```dart
  String _product = "";
  String _description = "";
  int _productAmount = 0;
  int _productPrice = 0;
```
Encasing each field with a Scaffold, as well as including the LeftDrawer that will be made later on:
```dart

Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Center(
      child: Text(
        'Add Your Product',
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
```
and for each field creating a `Padding` as such:
```dart
Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "product",
          labelText: "product",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _product = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "product cannot be empty!";
          }
          return null;
        },
      ),
    ),
    ...
    ...
```
This also ensures that the value is not empty using Flutter's `validator`, and in the case of numbers, use 
```dart
          if (price == null) {
            return "product price must be a number!";
          }
          if (price < 0) {
            return "product price cannot be negative!";
          }
          return null;
          ...
```
After submitting the data via the `save` button, show a popup showing the data that the user just entered:

```dart
showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('product successfully saved'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('product: $_product'),
                  Text('description: $_description'),
                  Text('amount: $_productAmount'),
                  Text('price: $_productPrice'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _formKey.currentState!.reset();
                },
```

Creating the drawer:
`widgets/left_drawer.dart`

Initialized a class named `LeftDrawer` as a `StatelessWidget`:
```dart
import 'package:flutter/material.dart';
import 'package:coquette_shop_mobile/screens/menu.dart';
import 'package:coquette_shop_mobile/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
```

Add the application name as a column child of LeftDrawer:
```dart
...
              children: [
                Text(
                  'coquette shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  'buy coquette items here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
...
```

Then add buttons for home and add Product buttons:
```dart
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Redirection part to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Add Product'),
            // Redirection part to ProductFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

# Assignment Questions

## What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?

const is useful for performance optimization as it is created at compile time - meaning they are only instantiated once. This reduces the overhead of creating multiple instances. They also use less memory. They are used for static content or compile-time constant values. Const should not be used for variables that are expected to change.

## Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!


Column: arranges its children in a vertical direction. Example implementation:

```dart
import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('First Item'),
          Text('Second Item'),
          Text('Third Item'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ColumnExample(),
  ));
}
```

Row: arranges its children in a horizontal direction. Example implementation:

```dart
import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Example'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('First Item'),
          Text('Second Item'),
          Text('Third Item'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RowExample(),
  ));
}
```
##  List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!

TextFormField was used in ProductFormPage (`product_form.dart`). There are other input elements not used, such as Checkbox, Radio, Switch, Slider, and DropdownButton.

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?

You can set a global theme by defining a ThemeData object and psassing it to the `theme` parameter of all `MaterialApp` widgets. In this application, it is already set in `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:coquette_shop_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coquette-shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF458588)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

##  How do you manage navigation in a multi-page Flutter application?

Flutter uses a stack to manage page navigation, and as such the buttons in this application use `Navigator.pushReplacement` or `Navigator.push` to redirec the user.
</details>