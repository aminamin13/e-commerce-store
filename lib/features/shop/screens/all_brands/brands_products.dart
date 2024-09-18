import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/cards/brand_card.dart';
import 'package:my_store/common/widgets/products/sorting/product_sortable.dart';
import 'package:my_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:my_store/features/shop/controllers/product/brands_controller.dart';
import 'package:my_store/features/shop/models/brands_model.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_helper_functions.dart';

class BrandsProducts extends StatelessWidget {
  const BrandsProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title:
            Text(brand.name, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(children: [
                BrandCard(
                  showBorder: true,
                  brand: brand,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                FutureBuilder(
                    future: controller.getBrandProducts(brandId: brand.id),
                    builder: (context, snapshot) {
                      const loader = VerticalProductShimmer();
                      final widget =
                          AppCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      final brandProduct = snapshot.data!;
                      return AppSortableProducts(
                        products: brandProduct,
                      );
                    })
              ]))),
    );
  }
}
