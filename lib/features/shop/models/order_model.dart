import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/features/personalization/models/address_model.dart';
import 'package:my_store/features/shop/models/cart_item_model.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deiveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = "",
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = "Paypal",
    this.address,
    this.deiveryDate,
    required this.items,
  });

  String get formattedOrderDate =>
      AppHelperFunctions.getFormattedDate(orderDate);

  String get formattedDelvierydate => deiveryDate != null
      ? AppHelperFunctions.getFormattedDate(deiveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? "Delivered"
      : status == OrderStatus.shipped
          ? "shippment on the way"
          : "Proccessing";

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "status": status.toString(),
      "totalAmount": totalAmount,
      "orderDate": orderDate,
      "paymentMethod": paymentMethod,
      "address": address?.toJson(),
      "deiveryDate": deiveryDate,
      "items": items.map((e) => e.toJson()).toList(),
  
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data["userId"] as String,
      status: OrderStatus.values.firstWhere((e)=> e.toString() == data["status"]),
      totalAmount: data["totalAmount"] as double,
      orderDate: (data["orderDate"] as Timestamp).toDate(),
      paymentMethod: data["paymentMethod"] as String,
      address: AddressModel.fromMap(data['address'] as Map<String,dynamic>),
      deiveryDate: data["deiveryDate"] == null ? null : (data["deiveryDate"] as Timestamp).toDate(),
      items: (data["items"] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
