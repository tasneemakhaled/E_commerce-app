import 'dart:developer';
import 'dart:typed_data';

class ProductModel {
  String? name, desc;
  int? favorite, cart, id, availableQuantity, quantity;
  Uint8List? image;

  ProductModel.fromJson(Map m) {
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    quantity = m['quantity'];
    availableQuantity = m['available_quantity'];
    cart = m['cart'];
    favorite = m['favourite'];
    id = m['id'];
  }
}
