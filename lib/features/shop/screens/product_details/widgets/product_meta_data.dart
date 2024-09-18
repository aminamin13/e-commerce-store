import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/container/app_rounded_container.dart';
import 'package:my_store/common/widgets/images/app_circular_image.dart';
import 'package:my_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:my_store/common/widgets/texts/product_price_text.dart';
import 'package:my_store/common/widgets/texts/product_title_text.dart';
import 'package:my_store/features/shop/controllers/product/product_controller.dart';
import 'package:my_store/features/shop/models/product_model.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price
        Row(children: [
          AppRoundedContainer(
            backgroundColor: AppColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm, vertical: AppSizes.xs),
            radius: AppSizes.sm,
            child: Text(
              "$salePercentage%",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: AppColors.black),
            ),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            Text(
              "\$${product.price}",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            const SizedBox(width: AppSizes.spaceBtwItems),
          ProductPriceText(
            price: controller.getProductPrice(product),
            isLarge: true,
          )
        ]),

        // name
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        ProductTitleText(title: product.title),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        // stock
        Row(
          children: [
            const ProductTitleText(title: "Stock: "),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Row(
          children: [
            AppCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? Colors.white : Colors.black,
              backgroundColor: Colors.transparent,
            ),
            BrandTitleWithVerifiedIcon(
              title: product.brand!.name,
              iconColor: AppColors.primary,
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
        // brand
      ],
    );
  }
}
