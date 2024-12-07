import 'package:bhattimandu/components/alert/quick_alert.dart';
import 'package:bhattimandu/database/my_cart_liquor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyCartController {
  /// Adds an item to the consumer's cart
  Future<void> addCart({
    required BuildContext context,
    required String uuid,
    required String liquorId,
    required String liquorName,
    required String price,
    required String image,
required String createdBy,
    required String status,
    required String quantity,
  }) async {
    try {
      await MyCartLiquor().addToCart(
          uuid: uuid,
          liquorId: liquorId,
          status: status,
          quantity: quantity,
          liquorName:liquorName,
createdBy:createdBy,
image:image,
          price:price
      );

      // Show success alert
      QuickAlert.showAlert(
        context,
        "Item added to cart successfully!",
        AlertType.success,
      );
    } catch (e) {
      QuickAlert.showAlert(
        context,
        "Error adding item to cart: $e",
        AlertType.error,
      );
    }
  }
  Future<List<Map<String, dynamic>>> getCartItems({
    required BuildContext context,
    required String uuid, required String status
  }) async {
    try {
      final cartCollection = FirebaseFirestore.instance.collection('liquor_carts');

      final querySnapshot = await cartCollection
          .where('uuid', isEqualTo: uuid)
          .where('status', isEqualTo: status)
          .get();

      final cartItems = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();

      return cartItems;
    } catch (e) {

      QuickAlert.showAlert(
        context,
        "Error adding item to cart: $e",
        AlertType.error,
      );
      return [];
    }
  }

}
