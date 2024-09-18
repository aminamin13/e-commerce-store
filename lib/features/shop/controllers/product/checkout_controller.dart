import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/shop/models/payment_method_model.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CheckOutController extends GetxController {
  static CheckOutController instance = Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedPaymentMethod.value =
        PaymentMethodModel(name: "PayPal", image: AppImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMehtod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionHeading(
                    title: "Select Payment Method",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "PayPal", image: AppImages.paypal)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "Google Pay", image: AppImages.googlePay)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "Apple Pay", image: AppImages.applePay)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "Visa", image: AppImages.visa)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "MasterCard", image: AppImages.masterCard)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "PayStack", image: AppImages.paystack)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: "Credit Card", image: AppImages.creditCard)),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                ],
              )),
        );
      },
    );
  }
}
