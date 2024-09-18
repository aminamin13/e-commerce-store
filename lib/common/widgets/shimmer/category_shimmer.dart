import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return const SizedBox(width: AppSizes.spaceBtwItems);
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems / 2,
              ),
              AppShimmerEffect(
                width: 55,
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
