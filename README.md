# ShopEasy – Flutter Shopping Cart App

A beginner-friendly Flutter shopping app that demonstrates **navigation**, **forms**, and **Provider state management** using local dummy data (no backend needed).

## Features
- 11 screens: Splash, Login, Signup, Categories, Products, Product Details, Cart, Place Order, My Orders, About Us, Contact Us
- Provider + ChangeNotifier (`CartProvider`, `OrderProvider`)
- Form validation, SnackBars, dialogs, drawer menu, cart badge
- Navigator: `push`, `pop`, `pushReplacement`, `pushAndRemoveUntil`

## Run
```bash
flutter create shopping_cart_app
cd shopping_cart_app
# replace lib/ and pubspec.yaml with the ones from this project
flutter pub get
flutter run
```

Login accepts any valid email and a password of 6+ characters (there is no backend).
