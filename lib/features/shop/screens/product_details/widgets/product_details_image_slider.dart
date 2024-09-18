import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:my_store/common/widgets/images/app_rounded_images.dart';
import 'package:my_store/common/widgets/products/favorit_icon/favorit_icon.dart';
import 'package:my_store/features/shop/controllers/product/images_controller.dart';
import 'package:my_store/features/shop/models/product_model.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());

    final images = controller.getAllProductImages(product);
    return AppCurvedEdgeWidget(
        child: Container(
      color: dark ? AppColors.darkerGrey : AppColors.light,
      child: Stack(children: [
        SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
              child: Center(child: Obx(() {
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    progressIndicatorBuilder: (_, __, downloadProgress) {
                      return CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.primary,
                      );
                    },
                  ),
                );
              })),
            )),
        Positioned(
          bottom: 30,
          right: 0,
          left: AppSizes.defaultSpace,
          child: SizedBox(
            height: 80,
            child: ListView.separated(
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  );
                },
                itemBuilder: (_, index) {
                  return Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return AppRoundedImage(
                      isNetworkImage: true,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      imageUrl: images[index],
                      width: 80,
                      padding: const EdgeInsets.all(AppSizes.sm),
                      border: Border.all(
                          color: imageSelected
                              ? AppColors.primary
                              : Colors.transparent),
                      backgroundColor: dark ? AppColors.dark : AppColors.white,
                    );
                  });
                }),
          ),
        ),
         AppAppBar(
          showBackArrow: true,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sm),
                child: FavoriteIcon(productId: product.id,)),
          ],
        )
      ]),
    ));
  }
}
