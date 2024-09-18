import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/success_screen/success_screen.dart';
import 'package:my_store/data/repositories/authentication_repository.dart';
import 'package:my_store/data/repositories/order/order_repository.dart';
import 'package:my_store/features/personalization/controllers/address_controller.dart';
import 'package:my_store/features/shop/controllers/product/cart_controller.dart';
import 'package:my_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:my_store/features/shop/models/order_model.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/loaders/snackbar.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = Get.put(CartController());
  final addressController = Get.put(AddressController());
  final checkoutController = Get.put(CheckOutController());
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      AppLoaders.warningSnackBar(title: "Error", message: e.toString());
      return [];
    }
  }

  // process the order
  void processOrder(double totalAmount) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          "Processing Order", AppImages.docerAnimation);

      // Get user authentication id

      final userId = AutheticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deiveryDate: DateTime.now(),
          items: cartController.cartItems.toList());

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();
      Get.off(() => SuccessScreen(
            image: AppImages.successfulPaymentIcon,
            title: "Successful Payment",
            subtitle: "Thank you for your purchase",
            onPressed: () {
              print("asdasd");
              Get.offAll(const NavigationMenu());
            },
          ));
    } catch (e) {
      AppLoaders.warningSnackBar(title: "Error", message: e.toString());
    }
  }
}
