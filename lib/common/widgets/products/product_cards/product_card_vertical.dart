import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/custom_shapes/container/app_rounded_container.dart';
import 'package:my_store/common/widgets/images/app_rounded_images.dart';
import 'package:my_store/common/widgets/products/favorit_icon/favorit_icon.dart';
import 'package:my_store/common/widgets/products/product_cards/ProductCardAddToCartButton.dart';
import 'package:my_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:my_store/common/widgets/texts/product_price_text.dart';
import 'package:my_store/common/widgets/texts/product_title_text.dart';
import 'package:my_store/features/shop/controllers/product/product_controller.dart';
import 'package:my_store/features/shop/models/product_model.dart';
import 'package:my_store/features/shop/screens/product_details/product_details.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    var isDark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetail(product: product));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey.withOpacity(0.1)),
          color: isDark ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        ),
        child: Column(
          children: [
            AppRoundedContainer(
              height: 180,
              backgroundColor: isDark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  AppRoundedImage(
                    imageUrl: product.thumbnail,
                    isNetworkImage: true,
                    applyImageRadius: true,
                  ),
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      left: 5,
                      child: AppRoundedContainer(
                          radius: AppSizes.sm,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.sm, vertical: AppSizes.xs),
                          backgroundColor: AppColors.secondary.withOpacity(0.8),
                          child: Text(
                            '$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: AppColors.black),
                          )),
                    ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: FavoriteIcon(
                        productId: product.id,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            // details
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                    brandTextSizes: TextSizes.small,
                    iconColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.salePrice > 0 &&
                          product.productType == ProductType.single.toString())
                        Padding(
                            padding: const EdgeInsets.only(left: AppSizes.sm),
                            child: Text(
                              "\$${product.price.toString()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            )),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSizes.sm),
                        child: ProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                // add to cart button
                 ProductCardAddToCartButton( product: product),
              ],
            )
          ],
        ),
      ),
    );
  }
}
