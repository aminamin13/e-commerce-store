import 'package:flutter/material.dart';
import 'package:my_store/features/shop/controllers/product/cart_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$$subTotal", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text(
                "\$${AppPricingCalculator.calculateShippingCost(subTotal, 'Us')}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${AppPricingCalculator.calculateTax(subTotal, 'Us')}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.titleLarge),
            Text(
                "\$${AppPricingCalculator.calculateTotalPrice(subTotal, "Us")}",
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ],
    );
  }
}
