import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/images/app_circular_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isdark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
          child: Column(
            children: [
              AppCircularImage(
                image: image,
                fit: BoxFit.fitWidth,
                padding: AppSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: isdark ? AppColors.light : AppColors.dark,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems / 2,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: isdark ? AppColors.dark : AppColors.light),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}
