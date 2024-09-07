import 'package:freezed/freezed.dart';

@Freezed()
class OrderItemEntity {
  final String id;
  final String orderId;

  final String productId;
  final int quantity;
}
