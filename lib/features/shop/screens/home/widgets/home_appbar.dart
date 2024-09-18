import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/productscart/cart_menu_icon.dart';
import 'package:my_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:my_store/features/personalization/controllers/user_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppAppBar(
      isTranspernet: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const AppShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.white));
            }
          })
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.sm),
          child: AppCartCounterItem(
            iconColor: AppColors.white,
            textColor: AppColors.black,
          ),
        )
      ],
    );
  }
}
