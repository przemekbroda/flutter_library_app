import 'package:flutter/cupertino.dart';
import 'package:library_flutter_app/model/Book.dart';

class CartProvider with ChangeNotifier {

  Map<int, Book> _cart = Map();

  Map<int, Book> get cart {
    return _cart;
  }

  void addToCart(Book book) {
    _cart.putIfAbsent(book.id, () => book);
    notifyListeners();
  }

  void removeFromCart(Book book) {
    _cart.remove(book.id);
    notifyListeners();
  }

  bool isInCart(Book book) {
    return cart.containsKey(book.id);
  }


}