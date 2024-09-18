import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/features/shop/screens/orders/widgets/order_list_items.dart';
import 'package:my_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title:
            Text("My Orders", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}
