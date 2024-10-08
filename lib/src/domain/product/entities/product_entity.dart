import 'package:freezed/freezed.dart';

@Freezed()
class ProductEntity {
  final String id;
  final String name;
  final double price;
}
