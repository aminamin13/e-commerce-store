import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:my_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:my_store/features/shop/controllers/category_controller.dart';
import 'package:my_store/features/shop/screens/sub_category/sub_category.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) return const AppCategoryShimmer();
      if (controller.featureCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return Center(
        child: SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: controller.featureCategories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = controller.featureCategories[index];
                  return AppVerticalImageText(
                    image: category.image,
                    title: category.name,
                    onTap: () {
                      Get.to( SubCategoriesScreen(category: category));
                    },
                  );
                })),
      );
    });
  }
}
