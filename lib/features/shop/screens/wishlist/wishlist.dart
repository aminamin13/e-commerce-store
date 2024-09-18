import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/icons/app_circular_icon.dart';
import 'package:my_store/common/widgets/layout/grid_layout.dart';
import 'package:my_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:my_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:my_store/features/shop/controllers/product/favorite_controller.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_helper_functions.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/popups/loaders.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return Scaffold(
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.light,
        appBar: AppAppBar(
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.dark
              : AppColors.light,
          title: Text("Wishlist",
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: AppCircularIcon(
                onPressed: () => Get.to(const NavigationMenu()),
                icon: Iconsax.add,
                backgroundColor: Colors.transparent,
                color: AppHelperFunctions.isDarkMode(context)
                    ? AppColors.white
                    : AppColors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  Obx(() => FutureBuilder(
                      future: controller.favoriteProducts(),
                      builder: (context, snapshot) {
                        final emptyWidget = AppAnimationLoaderWidget(
                          text: "Nothing in wishlist",
                          animation: AppImages.verifyIllustration,
                          showAction: false,
                          actionText: "Let's Shop",
                          onActionPressed: () => Get.to(const NavigationMenu()),
                        );

                        const loader = VerticalProductShimmer(
                          itemCount: 6,
                        );
                        final widget =
                            AppCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: loader,
                                nothingFound: emptyWidget);
                        if (widget != null) return widget;

                        final products = snapshot.data!;

                        return AppGridLayout(
                          padding: 10,
                          ItemCount: products.length,
                          itemBuilder: (_, index) {
                            return ProductCardVertical(
                              product: products[index],
                            );
                          },
                        );
                      }))
                ],
              )),
        ));
  }
}
