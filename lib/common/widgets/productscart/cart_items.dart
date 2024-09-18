import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/images/app_rounded_images.dart';
import 'package:my_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:my_store/common/widgets/texts/product_title_text.dart';
import 'package:my_store/features/shop/models/cart_item_model.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        AppRoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(
                title: cartItem.brandName ?? '',
              ),
              Flexible(
                child: ProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: "${e.key}: ",
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
