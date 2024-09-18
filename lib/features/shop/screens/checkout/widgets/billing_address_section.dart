import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/personalization/controllers/address_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressCntroller = Get.put(AddressController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
            title: "Shipping Address",
            onPressed: () {
              addressCntroller.selectNewAddressPopup(context);
            },
            buttonTitle: "Change",
            showActionButton: true),
        addressCntroller.selectedAddress.value.id.isNotEmpty
            ? Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressCntroller.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.grey, size: 16),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Text(
                            addressCntroller
                                .selectedAddress.value.formattedPhoneNo,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Text(addressCntroller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ))
            : Text("Select Address",
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
