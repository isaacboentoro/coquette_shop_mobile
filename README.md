<details>
<Summary><b>Assignment 7</b><Summary>

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