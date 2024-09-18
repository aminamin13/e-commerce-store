import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/icons/app_circular_icon.dart';
import 'package:my_store/features/shop/controllers/product/favorite_controller.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(() => AppCircularIcon(
      onPressed: () => controller.toggleFavoriteProduct(productId),
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ? Colors.red : null));
  }
}
