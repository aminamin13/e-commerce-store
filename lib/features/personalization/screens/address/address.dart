import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/features/personalization/controllers/address_controller.dart';
import 'package:my_store/features/personalization/screens/address/add_new_address.dart';
import 'package:my_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_helper_functions.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNewAddressScreen());
        },
        backgroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Obx(() => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUsersAddresses(),
              builder: (context, snapshot) {
                final response = AppCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;
                final addressess = snapshot.data!;

                return ListView.builder(
                  itemCount: addressess.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleAddress(
                      address: addressess[index],
                      onTap: () {
                        controller.selecteAddress(addressess[index]);
                      },
                    );
                  },
                );
              })),
        ),
      ),
    );
  }
}
