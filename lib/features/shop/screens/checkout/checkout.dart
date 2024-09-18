import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/custom_shapes/container/app_rounded_container.dart';
import 'package:my_store/common/widgets/productscart/coupon_code.dart';
import 'package:my_store/features/shop/controllers/product/cart_controller.dart';
import 'package:my_store/features/shop/controllers/product/order_controller.dart';
import 'package:my_store/features/shop/screens/cart/widgets/cart_items_list.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/helpers/pricing_calculator.dart';
import 'package:my_store/utils/loaders/snackbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = controller.totalCartPrice.value;
    final totalAmount =
        AppPricingCalculator.calculateTotalPrice(subTotal, "Us");

    var dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text("Order Review",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              subTotal > 0
                  ? () => orderController.processOrder(totalAmount)
                  : () => AppLoaders.warningSnackBar(
                      title: "Empty Cart",
                      message: " Please add items to cart");
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: Text("Checkout \$$totalAmount")),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: AppSizes.defaultSpace,
              ),
              const AppCouponCode(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              AppRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    BillingPaymentSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
