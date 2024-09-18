import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/custom_shapes/container/app_rounded_container.dart';
import 'package:my_store/features/shop/controllers/product/order_controller.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_helper_functions.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/popups/loaders.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = AppAnimationLoaderWidget(
            text: "Woops, No Orders",
            animation: AppImages.productsIllustration,
            showAction: true,
            actionText: "Lets Shop",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final response = AppCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          final orders = snapshot.data!;
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return AppRoundedContainer(
                  padding: const EdgeInsets.all(AppSizes.md),
                  showBorder: true,
                  backgroundColor: dark ? AppColors.dark : AppColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.ship),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: AppColors.primary,
                                            fontWeightDelta: 1)),
                                Text(order.formattedOrderDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.arrow_right_34,
                                  size: AppSizes.iconSm))
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.tag),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!),
                                Text(order.id,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.calendar),
                                const SizedBox(
                                  width: AppSizes.spaceBtwItems / 2,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Shipping Date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!),
                                    Text(order.formattedDelvierydate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
