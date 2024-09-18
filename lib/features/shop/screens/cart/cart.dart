import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/features/shop/controllers/product/cart_controller.dart';
import 'package:my_store/features/shop/screens/cart/widgets/cart_items_list.dart';
import 'package:my_store/features/shop/screens/checkout/checkout.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/popups/loaders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const CheckoutScreen());
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: Obx(() =>
                    Text("Checkout \$${controller.totalCartPrice.value}")),
              ),
            ),
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = AppAnimationLoaderWidget(
          text: "Your cart is empty",
          animation: AppImages.deliveredEmailIllustration,
          showAction: true,
          actionText: "Let's Fill The Cart",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        return controller.cartItems.isEmpty
            ? emptyWidget
            : const Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: AppCartItems(
                  showAddRemoveButtons: true,
                ));
      }),
    );
  }
}
