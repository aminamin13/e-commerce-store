import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/cards/brand_card.dart';
import 'package:my_store/common/widgets/custom_shapes/container/app_rounded_container.dart';
import 'package:my_store/features/shop/models/brands_model.dart';
import 'package:my_store/features/shop/screens/all_brands/brands_products.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppBrandShowCase extends StatelessWidget {
  const AppBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BrandsProducts(brand: brand));
      },
      child: AppRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(AppSizes.md),
        backgroundColor: Colors.transparent,
        borderColor: AppColors.darkGrey,
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            BrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList())
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: AppRoundedContainer(
        height: 100,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.light,
        margin: const EdgeInsets.only(right: AppSizes.sm),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: NetworkImage(image),
        )),
  );
}
